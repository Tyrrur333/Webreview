class TopsController < ApplicationController
  def home
    @appposts = Apppost.all
  end

  def contact
  end

  def privacy_policy
  end

  def terms_of_use
  end
end
