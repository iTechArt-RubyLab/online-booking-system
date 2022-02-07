module PunditHelper
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    # flash[:alert] = "Access denied."
    # redirect_to (request.referrer || root_path)
    render json: 'user_not_authorized', status: :forbidden
  end

end

ApplicationController.send :include, PunditHelper
