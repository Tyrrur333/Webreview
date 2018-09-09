class TopsController < ApplicationController

  def home
    @appposts = Apppost.all
    @recent_post = Apppost.limit(5).order('id DESC')

    @attention_post = Apppost.joins(:reviews).order('@review_count desc').limit(7)
  end

  def contact
  end

  def privacy_policy
  end

  def terms_of_use
  end
end
