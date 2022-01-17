class Api::V1::SalonsController < ApplicationController
  def index
    salons = Salon.all
    render json: salons, status: 200
  end

  def show
    salon = Salon.find_by(id: params[:id])
    if salon
      render json: salon, status: 200
    else
      render json: { error: 'Error creating review.' }
    end
  end

  private

  def salon_params
    params.require(:salon).permit([:name, :address])
  end
end
