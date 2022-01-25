module Api
  module V1
    class VisitsController < ApplicationController
      before_action :set_visit, only: %i[show update destroy]

      attr_accessor :visit

      def index
        sorting = params[:sort]
        render json: Visit.order(sort_params.to_h) if sorting
        render json: Visit.all unless sorting
      end

      def sort_params
        params.require(:sort).permit(sort_colonum)
      end

      def sort_colonum
        Visit.column_names.map(&:to_s)
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
          render json: visit
        else
          render json: { error: 'Unable to update visit' }
        end
      end

      def destroy
        if visit.destroy
          render json: visit
        else
          render json: { error: 'Unable to delete visit' }
        end
      end

      private

      def set_visit
        @visit = Visit.find(params[:id])
      end

      def visit_params
        params.permit(:start_at, :end_at, :price, :adress, :status)
      end
    end
  end
end
