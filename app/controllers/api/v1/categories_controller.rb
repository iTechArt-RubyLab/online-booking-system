module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]

      attr_accessor :categories

      def index
        categories = Category.all
        render json: categories
      end

      def show
        render json: categories
      end

      def edit

      end

      def create
        categories = Category.new(category_params)

        if categories.save!
          render json: categories
        else
          render json: { error: 'Error creating user.' }, status: :unprocessable_entity
        end
      end

      def update
        if categories.update(category_params)
          render json: categories
        else
          render json: { error: 'Error updating user.' }, status: :unprocessable_entity
        end
      end

      def destroy
        if categories.destroy
          render json: categories
        else
          render json: { error: 'Error deleting user.' }, status: :unprocessable_entity
        end
      end

      private

      def category_params
        params.permit(%i[name])
      end

      def set_category
        @categories = Category.find(params[:id])
      end
    end
  end
end
