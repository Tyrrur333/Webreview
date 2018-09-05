class ReviewsController < ApplicationController
  before_action :logged_in_user, only:[:new,:create, :edit, :update, :destroy]

  def index
    @apppost = Apppost.find(params[:apppost_id])
    @review = Review.all
  end

  def new
    @apppost = Apppost.find(params[:apppost_id])
    @review = Review.new
  end

  def create
    review = Review.create!(stars:review_params[:stars],review_title:review_params[:review_title],
                            review_content:review_params[:review_content],user_id:session[:user_id],apppost_id:params[:apppost_id])
    flash[:success] = "レビューの投稿に成功しました"
    redirect_to apppost_url(params[:apppost_id])
  end

  def edit
    @review = Review.new
    @apppost = Apppost.find(params[:id])
  end

  def update
    @review = current_user.review.create(review_params)
    if @review.save
      flash[:success] = "レビューの編集に成功しました"
      redirect_to @apppost
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

    def review_params
      params.require(:review).permit(:stars, :review_title, :review_content, :user_id, :apppost_id)
    end
end
