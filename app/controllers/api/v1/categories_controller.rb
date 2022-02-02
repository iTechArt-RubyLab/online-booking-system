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

      private

      def find_category
        @category = Category.find(params[:id])
      end
    end
  end
end
