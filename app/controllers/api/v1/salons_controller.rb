class Api::V1::SalonsController < ApplicationController
  def index
    salons = Salon.all
    render json: salons
  end

  def show
    salon = Salon.find_by(id: params[:id])
    if salon
      render json: salon
    else
      render json: { error: 'Error creating review.' }
    end
  end

  def create
    salon = Salon.new(
      name: salon_params[:name],
      address: salon_params[:address]
    )
    if salon.save!
      render json: salon
    else
      render json: { error: 'Error creating review.' }
    end
  end

  private

  def salon_params
    params.require(:salon).permit([:name, :address])
  end
end
