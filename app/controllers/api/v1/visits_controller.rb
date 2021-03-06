module Api
  module V1
    class VisitsController < ApplicationController
      before_action :find_visit, only: %i[show update destroy
                                          approve reject_by_user reject_by_client
                                          finish]

      before_action :authenticate_api_v1_user!
      before_action :find_visit, only: %i[show update destroy]
      before_action :authorize_visit
      after_action :verify_authorized

      def search
        @visits = Visit.search(search_params[:info]).records.to_a
        render json: convert_to_json(@visits)
      end

      def index
        @visits =
          if params[:sort]
            Visit.order(Visit::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Visit.paginate(page: params[:page], per_page: 15)
          end

        render json: convert_to_json(@visits)
      end

      def show
        render json: convert_to_json(@visit)
      end

      def create
        @visit = Visit.new(visit_params)
        if @visit.save
          render json: convert_to_json(@visit)
        else
          render json: errors(@visit), status: :unprocessable_entity
        end
      end

      def update
        if @visit.update(visit_params)
          render json: convert_to_json(@visit)
        else
          render json: errors(@visit), status: :unprocessable_entity
        end
      end

      def destroy
        @visit.destroy
        render json: convert_to_json(@visit)
      end

      def approve
        @visit.approve!
        render json: @visit.visit_status
      end

      def reject_by_user
        @visit.reject_by_user!
        render json: @visit.visit_status
      end

      def reject_by_client
        @visit.reject_by_client!
        render json: @visit.visit_status
      end

      def finish
        @visit.finish!
        render json: @visit.visit_status
      end

      private

      def search_params
        params.require(:search).permit(:info)
      end

      def convert_to_json(object)
        VisitSerializer.new(object).serializable_hash.to_json
      end

      def find_visit
        @visit = Visit.find(params[:id])
      end

      def visit_params
        params.require(:visit).permit(:start_at, :end_at, :price, :address, :client_id, :salon_id,
                                      :service_id, :user_id)
      end

      def authorize_visit
        authorize(@visit || Visit)
      end
    end
  end
end
