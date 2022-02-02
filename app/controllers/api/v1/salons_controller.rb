module Api
  module V1
    class SalonsController < ApplicationController
      before_action :find_salon, only: %i[show update destroy]

      def index
        @salons =
          if params[:sort]
            Salon.order(Salon::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Salon.paginate(page: params[:page], per_page: 15)
          end
        render json: @salons
      end

      def show
        if @salon
          render json: @salon
        else
          render json: { error: 'Salon not found' }, status: :not_found
        end
      end

      def create
        @salon = Salon.new(salon_params)

        if @salon.save!
          render json: @salon
        else
          render json: { error: 'Error creating salon.' }, status: :unprocessable_entity
        end
      end

      def update
        if @salon.update(salon_params)
          render json: @salon
        else
          render json: { error: 'Update not update salon' }, status: :unprocessable_entity
        end
      end

      def destroy
        if @salon.destroy
          render json: @salon
        else
          render json: { error: 'Error deleting salon' }, status: :unprocessable_entity
        end
      end

      private

      def find_salon
        @salon = Salon.find(params[:id])
      end

      def salon_params
        params.require(:salon).permit(%i[name address phone email notes latitude longitude])
      end
    end
  end
end
