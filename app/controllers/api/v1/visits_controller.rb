module Api
  module V1
    class VisitsController < ApplicationController
      before_action :find_visit, only: %i[show update destroy]

      def index
        sorting = params[:sort]
        @visits = Visit.order(sort_params.to_h) if sorting
        @visits = Visit.paginate(page: params[:page], per_page: 10) unless sorting

        render json: @visits
      end

      def show
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
        if @visit.update(visit_params)
          render json: @visit
        else
          render json: { error: 'Unable to update visit' }
        end
      end

      def destroy
        if @visit.destroy
          render json: @visit
        else
          render json: { error: 'Unable to delete visit' }
        end
      end

      private

      def find_visit
        @visit = Visit.find(params[:id])
      end

      def visit_params
        params.require(:visit).permit(:start_at, :end_at, :price, :address, :status)
      end
    end
  end
end
