module Api
  module V1
    class ServicesController < ApplicationController
      before_action :find_service, only: %i[show update destroy]
      before_action :authorize_service
      after_action :verify_authorized


      def index
        @services =
          if params[:sort]
            Service.order(Service::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Service.paginate(page: params[:page], per_page: 15)
          end

        render json: convert_to_json(@services)
      end

      def show
        render json: convert_to_json(@service)
      end

      def create
        @service = Service.new(service_params)

        if @service.save
          render json: convert_to_json(@service)
        else
          render json: convert_to_json(errors(@service)), status: :bad_request
        end
      end

      def update
        if @service.update(service_params)
          render json: convert_to_json(@service)
        else
          render json: convert_to_json(errors(@service)), status: :bad_request
        end
      end

      def destroy
        if @service&.destroy
          render json: convert_to_json(@service)
        else
          render json: convert_to_json(errors(@service)), status: :bad_request
        end
      end

      private

      def convert_to_json(object)
        ServiceSerializer.new(object).serializable_hash.to_json
      end

      def find_service
        @service = Service.find(params[:id])
      end

      def service_params
        params.require(:service).permit(%i[salon_id name
                                           description duration price
                                           availability category_id])
      end

      def authorize_service
        authorize @service
      end
    end
  end
end
