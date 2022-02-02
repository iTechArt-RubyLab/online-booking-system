module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :find_category, only: %i[show]

      def index
        @categories = Category.all
        render json: @categories
      end

      def show
        render json: @category
      end

      def create
        @category = Category.new(category_params)
        @category.images.attach(params[:images])

        if @category.save!
          render json: @category
        else
          render json: { error: 'Error creating user.' }, status: :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: { error: 'Error updating user.' }, status: :unprocessable_entity
        end
      end

      def destroy
        if @category.destroy
          render json: @category
        else
          render json: { error: 'Error deleting user.' }, status: :unprocessable_entity
        end
      end

      private

      def category_params
        params.permit(%i[name images: []])
      end

      def find_category
        @category = Category.find(params[:id])
      end
    end
  end
end
