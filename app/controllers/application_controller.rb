# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::ReordNotFound, with: :record_not_found

  private

  def record_not_found(exception)
    render json: { error: exception.to_s }, status: :not_found
  end
end
