# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :arguments_error
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveModel::UnknownAttributeError, with: :unknown_attribute_error
  rescue_from ActionController::RoutingError, with: :routing_error # not working!
  rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid # not working!
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

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
