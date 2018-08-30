module ApppostsHelper

  def current_app
    @current_app ||= Apppost.find_by(id: @apppost.id)
  end
end
