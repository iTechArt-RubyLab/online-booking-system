module Api
  module V1
    class SalonsController < ApplicationController
      #before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :find_salon, only: %i[show update destroy]
      before_action :authorize_salon
      after_action :verify_authorized

      def index
        @salons =
          if params[:sort]
            Salon.order(Salon::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Salon.paginate(page: params[:page], per_page: 15)
          end
        render json: convert_to_json(@salons)
      end

      def show
        if @salon
          render json: convert_to_json(@salon)
        else
          render json: convert_to_json(errors(@salon)), status: :not_found
        end
      end

      def create
        @salon = Salon.new(salon_params)

        if @salon.save!
          render json: convert_to_json(@salon)
        else
          render json: convert_to_json(errors(@salon)), status: :unprocessable_entity
        end
      end

      def update
        if @salon.update(salon_params)
          render json: convert_to_json(@salon)
        else
          render json: convert_to_json(errors(@salon)), status: :unprocessable_entity
        end
      end

      def destroy
        if @salon.destroy
          render json: convert_to_json(@salon)
        else
          render json: { error: 'Error deleting salon' }, status: :unprocessable_entity
        end
      end

      def update_reminder
        find_salon_for_reminders
        if @salon.update(reminder_params)
          render json: { message: 'Reminder was successfully added' }
        else
          render json: { error: 'Try again' }, status: :unprocessable_entity
        end
      end

      private

      def convert_to_json(object)
        SalonSerializer.new(object).serializable_hash.to_json
      end

      def find_salon
        @salon = Salon.find(params[:id])
      end

      def salon_params
        params.require(:salon).permit(%i[name address phone email notes latitude longitude remind_up_min])
      end

      def find_salon_for_reminders
        @salon = Salon.find(params[:salon_id])
      end

      def reminder_params
        params.require(:salon).permit(:remind_up_min)
      end

      def authorize_salon
        authorize(@salon || Salon)
      end
    end
  end
end
