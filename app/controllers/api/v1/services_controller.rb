module Api
  module V1
    class ServicesController < ApplicationController
      before_action :set_service, only: %i[show update destroy]

      attr_accessor :service

      def index
        @services =
          if params[:sort]
            Service.order(Service::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Service.paginate(page: params[:page], per_page: 15)
          end
        render json: @services
      end

      def show
        render json: service
      end

      def create
        service = Service.new(service_params)

        if service.save
          render json: service
        else
          render json: { message: service.errors.full_messages }, status: :bad_request
        end
      end

      def update
        if service.update(service_params)
          render json: service
        else
          render json: { message: service.errors.full_messages }, status: :bad_request
        end
      end

      def destroy
        if service&.destroy
          render json: service
        else
          render json: { message: service.errors.full_messages }, status: :bad_request
        end
      end

      private

      def set_service
        @service = Service.find(params[:id])
      end

      def service_params
        params.require(:service).permit(%i[category_id
                                           salon_id
                                           name
                                           description
                                           duration
                                           price
                                           hidden_price
                                           availability])
      end
    end
  end
end
