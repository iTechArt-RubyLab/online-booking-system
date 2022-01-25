module Api
  module V1
    class VisitsController < ApplicationController
      before_action :set_visit, only: %i[show update destroy]

      attr_accessor :visit

      def index
        if params[:sort]
          sort_params = params[:sort]

          if sort_params[:start_at]
            sort_field = :start_at
            sort_order = sort_params[:start_at]
          end

          if sort_params[:end_at]
            sort_field = :end_at
            sort_order = sort_params[:end_at]
          end

          if sort_params[:adress]
            sort_field = :adress
            sort_order = sort_params[:adress]
          end

          if sort_params[:price]
            sort_field = :price
            sort_order = sort_params[:price]
          end
          @visits = Visit.order(sort_field => sort_order)
        else
          @visits = Visit.all
        end
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
        params.require(:visit).permit(:start_at, :end_at, :price, :address, :status)
      end
    end
  end
end
