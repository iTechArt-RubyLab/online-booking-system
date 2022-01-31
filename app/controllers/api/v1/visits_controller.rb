module Api
  module V1
    class VisitsController < ApplicationController
      before_action :set_visit, only: %i[show update destroy]

      attr_accessor :visit

      def search
        render json: Visit.search(search_params[:info]).records.to_a
      end

      def index
        @visits =
          if params[:sort]
            Visit.order(Visit::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Visit.paginate(page: params[:page], per_page: 15)
          end
        render json: @visits
      end

      def sort_params
        params.require(:sort).permit(sort_column)
      end

      def sort_column
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

      def search_params
        params.require(:search).permit(:info)
      end

      def set_user
        @user = User.find(params[:id])
      end

      def set_visit
        @visit = Visit.find(params[:id])
      end

      def visit_params
        params.require(:visit).permit(:start_at, :end_at, :price, :address, :status)
      end
    end
  end
end
