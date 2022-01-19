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

  def create
    service = Service.new(service_params)
    
    if service.save()
      render json: service
    else
      render json: { message: service.errors.full_messages }, status: 400
    end
  end

  def destroy
    service = Service.find_by(id: params[:id])
    
    if service&.destroy
      render json: service
    else
      render json: { message: 'service not found' }, status: 404
    end
  end

  private

  def service_params
    params.require(:service).permit([:category_id,
                                     :salon_id,
                                     :name,
                                     :description,
                                     :duration,
                                     :price,
                                     :hidden_price,
                                     :availability])
  end
end
