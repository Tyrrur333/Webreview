class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    # MailSender.inquiry(@inquiry).deliver
    if @inquiry.save
      flash[:info] = 'お問い合わせメールが送信されました。'
      redirect_to root_url
    else
      render 'new'
    end
  end


  private
    def inquiry_params
      params.require(:inquiry).permit(:email, :contents)
    end
end
