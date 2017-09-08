class Admin::Pcloud::DeviceCertsController < AdminController
  before_action { authorize! :manage, :pcloud_management }

  def index 
    @device_crts = Pcloud::DeviceCert.all
  end

  def show 
    @device_cert = Pcloud::DeviceCert.find(valid_params[:id])
  end

  def new
    @device_cert = Pcloud::DeviceCert.new
  end

  def create
    @device_cert = Pcloud::DeviceCert.new
    @device_cert.description = pcloud_device_cert_params[:description]
    unless pcloud_device_cert_params[:cert_file].blank?
      @device_cert.content = uploaded_crt
    end
    if @device_cert.save
      Log.write(current_user, nil, request.remote_ip, 'create_device_cert', {
        serial: @device_cert.serial
      })
      redirect_to admin_pcloud_device_cert_url(@device_cert)
    else
      render :new
    end
  end

  def edit
    @device_cert = Pcloud::DeviceCert.find(valid_params[:id])
    puts "@device_cert: #{@device_cert.inspect}"
  end 

  def update 
    @device_cert = Pcloud::DeviceCert.find(valid_params[:id])
    update_data = {
      description: pcloud_device_cert_params[:description]
    }
    unless pcloud_device_cert_params[:cert_file].blank?
      update_data["content"] = uploaded_crt
    end
    if @device_cert.update(update_data)
      Log.write(current_user, nil, request.remote_ip, 'update_device_cert', {
        serial: @device_cert.serial
      })
      redirect_to admin_pcloud_device_cert_url(@device_cert)
    else
      render :edit
    end
  end 

  private 

    def valid_params
      params.permit(:id, :cert_file, :description)
    end

    def pcloud_device_cert_params
      params.require(:pcloud_device_cert).permit(:cert_file, :description)
    end

    def uploaded_crt
      file_data = pcloud_device_cert_params[:cert_file].tempfile
      crt_content = ""
      File.open(file_data, 'r') do |file|
        crt_content = file.read
      end
      crt_content
    end
end