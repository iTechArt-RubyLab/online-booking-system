class Api::V1::VisitsController < ApplicationController
  def index
    @visits = Visit.all
    render json: @visits
  end

  def show
    visit
    render json: @visit
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      render json: @visit
    else
      render error: { error: 'Could not create visit' }
    end
  end

  def update
    if visit.update(visit_params)
      render json: { message: 'Visit was successfully updated' }
    else
      render json: { error: 'Unable to update visit' }
    end
  end

  def destroy
    if visit.destroy
      render json: { message: 'Visit was successfully deleted' }
    else
      render json: { error: 'Unable to delete visit' }
    end
  end

  private

  def visit
    @visit ||= Visit.find(params[:id])
  end

  def visit_params
    params.permit(:start_at, :end_at, :price, :adress, :status)
  end
end
