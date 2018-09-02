class ApppostsController < ApplicationController
  before_action :logged_in_user, only:[:new, :edit, :update]
  def index
    @appposts = Apppost.all
  end

  def show
    @user = User.find(params[:id])
    @apppost = Apppost.find(params[:id])
    @reviews = current_user.reviews.build if logged_in?
  end

  def new
    @apppost = Apppost.new
  end

  def create
    @apppost = Apppost.new(apppost_params)
    if @apppost.save
      flash[:success] = "投稿が成功しました"
      redirect_to @apppost
    else
      render 'new'
    end
  end

  def edit
    @apppost = Apppost.find(params[:id])
  end

  def update
    @apppost = Apppost.find(params[:id])
    if @apppost.update_attributes(apppost_params)
      flash[:success] = "編集を保存しました"
      redirect_to @apppost
    else
      render 'edit'
    end
  end

  private
    def apppost_params
      params.require(:apppost).permit(:app_name, :url, :category, :app_image, :author, :description)
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
