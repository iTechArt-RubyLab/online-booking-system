# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :arguments_error
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveModel::UnknownAttributeError, with: :unknown_attribute_error
  rescue_from ActionController::RoutingError, with: :routing_error # not working!
  rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid # not working!
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AASM::InvalidTransition, with: :invalid_transition
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name middle_name
                                               email phone birthday role
                                               status notes avatar work_phone work_email])
  end

  private

  def errors(object)
    { error: object.errors.full_messages }
  end

  def invalid_transition(exception)
    render json: { error: exception.to_s }, status: :unprocessable_entity
  end

  def record_not_found(exception)
    render json: { error: exception.to_s }, status: :not_found
  end

  def arguments_error(exception)
    render json: { error: exception.to_s }, status: :bad_request
  end

  def record_invalid(exception)
    render json: { error: exception.to_s }, status: :unprocessable_entity
  end

  def unknown_attribute_error(exception)
    render json: { error: exception.to_s }, status: :unprocessable_entity
  end

  def routing_error(exception)
    render json: { error: exception.to_s }, status: :not_found
  end

  def statement_invalid(exception)
    render json: { error: exception.to_s }, status: :unprocessable_entity
  end

  def parameter_missing(exception)
    render json: { error: exception.to_s }, status: :unprocessable_entity
  end
end
