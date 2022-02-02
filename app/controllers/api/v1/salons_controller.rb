module Api
  module V1
    class SalonsController < ApplicationController
      before_action :find_salon, only: %i[show update destroy]

      def index
        sorting = params[:sort]
        render json: Salon.order(sort_params.to_h) if sorting
        render json: Salon.all unless sorting
        @salons = Salon.paginate(page: params[:page], per_page: 15)
        render json: @salons
      end

      def show
        if @salon
          render json: @salon
        else
          render json: { error: 'Error creating review.' }
        end
      end

      def create
        @salon = Salon.new(salon_params)

        if @salon.save!
          render json: @salon
        else
          render json: { error: salon.errors.full_messages }
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
          render json: { error: 'Unable to delete salon' }, status: :unprocessable_entity
        end
      end

      private

      def find_salon
        @salon = Salon.find(params[:id])
      end

      def salon_params
        params.require(:salon).permit(%i[name address phone email notes owner_id])
      end
    end
  end
end
