module Api
  module V1
    class SalonsController < ApplicationController
      before_action :set_salon, only: %i[show update destroy]

      attr_accessor :salon

      def index
        sorting = params[:sort]
        render json: Salon.order(sort_params.to_h) if sorting
        render json: Salon.all unless sorting
        @salons = Salon.paginate(page: params[:page], per_page: 15)
        render json: @salons
      end

      def show
        if salon
          render json: salon
        else
          render json: { error: 'Error creating review.' }
        end
      end

      def create
        @salon = Salon.new(salon_params)

        if salon.save!
          render json: salon
        else
          render json: { error: salon.errors.full_messages }
        end
      end

      def update
        if salon.update(salon_params)
          render json: { message: 'Salon was successfully updated' }
        else
          render json: { error: 'Update not update salon' }, status: :unprocessable_entity
        end
      end

      def destroy
        if salon.destroy
          render json: { message: 'Salon was successfully updated' }
        else
          render json: { error: 'Unable to delete salon' }, status: :unprocessable_entity
        end
      end

      private

      def set_salon
        @salon = Salon.find(params[:id])
      end

      def sort_params
        params.require(:sort).permit(salon_columns)
      end

      def salon_columns
        Salon.column_names.map(&:to_s)
      end

      def salon_params
        params.require(:salon).permit(%i[name address phone email notes owner_id])
      end
    end
  end
end
