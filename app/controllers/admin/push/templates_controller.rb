class Admin::Push::TemplatesController < AdminController
  before_action { authorize! :manage, :push_management }

  def index
    @templates = Pcloud::Template.all
    # puts @templates.inspect
  end

  def show
    @templates = Pcloud::Template.find(params[:identity])
  end

  def new
    @template = Pcloud::Template.new
  end

  def edit
  end
end
