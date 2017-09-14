class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_usuario!
  layout :layout_by_resource

  private

  def pundit_user
    current_usuario
  end

  def user_not_authorized
    flash[:alert] = 'Você não tem autorização.'
    redirect_to(request.referrer || root_path)
  end

  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end
end
#
