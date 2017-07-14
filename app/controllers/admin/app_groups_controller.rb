class Admin::AppGroupsController < AdminController

  before_action { authorize! :manage, :push_management }

  def index
    timestamp = Push.timestamp
    begin
      response = RestClient::Request.execute(
        method: :get,
        url: 'https://push.myzyxel.ecoworkinc.com/v1/app_groups',
        headers: {
          'X-Eco-Timestamp' => timestamp,
          'X-Eco-Signature' => Push.sign({ 'X-Eco-Timestamp' => timestamp }),
          params: {
            :access_key_id => '660ec58a-a0f2-4ac4-8393-c866d813b8d1'
          }
        }
      )
      # puts JSON.parse(response)['data']
      @data = JSON.parse(response)['data']


    rescue => e
      p e
      flash[:error] = JSON.parse(e.response.body)['message']
    end

  end

  def show
    timestamp = Push.timestamp
    begin
      response = RestClient::Request.execute(
        method: :get,
        url: "https://push.myzyxel.ecoworkinc.com/v1/app_groups/#{params[:id]}",
        headers: {
          'X-Eco-Timestamp' => timestamp,
          'X-Eco-Signature' => Push.sign({ 'X-Eco-Timestamp' => timestamp, app_group_id: params[:id] }),
          params: {
            :access_key_id => '660ec58a-a0f2-4ac4-8393-c866d813b8d1',
            :app_group_id => params[:id]
          }
        }
      )
      # puts JSON.parse(response)['data']
      @data = JSON.parse(response)['data']


    rescue => e
      p e
      flash[:error] = JSON.parse(e.response.body)['message']
    end

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

end
