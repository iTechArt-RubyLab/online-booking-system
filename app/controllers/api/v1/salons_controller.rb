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
      address: salon_params[:address],
      phone: salon_params[:phone],
      email: salon_params[:email],
      notes: salon_params[:notes],
      links: salon_params[:links],
      owner_id: salon_params[:owner_id]
    )
    if salon.save!
      render json: salon
    else
      render json: { error: 'Error creating review.' }
    end
  end

  private

  def salon_params
    params.require(:salon).permit([:name, :address, :phone, :email, :notes, :links, :owner_id])
  end
end
