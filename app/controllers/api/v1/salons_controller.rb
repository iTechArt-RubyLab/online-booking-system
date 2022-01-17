class Api::V1::SalonsController < ApplicationController
  def index
    salons = Salon.all
    render json: salons, status: 200
  end

  def show
  end
end
