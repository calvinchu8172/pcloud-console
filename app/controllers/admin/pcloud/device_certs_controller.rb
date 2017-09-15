class Admin::Pcloud::DeviceCertsController < AdminController
  before_action { authorize! :manage, :pcloud_management }
  before_action :set_device_cert, only: [:show, :edit, :update]

  def index
    @device_crts = Pcloud::DeviceCert.all
  end

  def show
  end

  def new
    @device_cert = Pcloud::DeviceCert.new
  end

  def create
    @device_cert = Pcloud::DeviceCert.new(device_cert_params)
    if @device_cert.save
      Log.write(current_user, nil, request.remote_ip, 'create_device_cert', {
        serial: @device_cert.serial
      })
      redirect_to admin_pcloud_device_cert_url(@device_cert)
    else
      flash.now[:error] = @device_cert.api_error_message if @device_cert.api_error?
      render :new
    end
  end

  def edit
  end

  def update
    if @device_cert.update(device_cert_params)
      Log.write(current_user, nil, request.remote_ip, 'update_device_cert', {
        serial: @device_cert.serial
      })
      redirect_to admin_pcloud_device_cert_url(@device_cert)
    else
      flash.now[:error] = @device_cert.api_error_message if @device_cert.api_error?
      render :edit
    end
  end

  private

    def set_device_cert
      @device_cert = Pcloud::DeviceCert.find(params[:id])
    end

    def device_cert_params
      @device_cert_params = params.require(:pcloud_device_cert).permit(:cert_file, :description)
      if @device_cert_params[:cert_file].present?
        file_data = @device_cert_params[:cert_file].tempfile
        File.open(file_data, 'r') do |file|
          @device_cert_params[:content] = file.read
        end
      end
      @device_cert_params
    end
end
