class Api::V1::ServicesController < ApplicationController
  def index
    services = Service.all
    render json: services
  end

  def show
    service = Service.find_by(id: params[:id])
    
    render json: service if service
    render json: { message: 'service not found' }, status: 404 unless service
  end

  private

end
