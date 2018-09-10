class ApppostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  def index
    @appposts = Apppost.all
  end

  def category_index
    @appposts = Apppost.all.where(category_id: params[:category_id])
    @categories = Category.all
  end

  def show
    @recent_post = Apppost.limit(5).order('id DESC')
    @apppost = Apppost.find(params[:id])
    @reviews = @apppost.reviews
    @review = Review.paginate(page: params[:page], per_page: 7)
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
      params.require(:apppost).permit(:app_name, :url, :category, :app_image, :author, :description, :apppost_id, :category_id )
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
