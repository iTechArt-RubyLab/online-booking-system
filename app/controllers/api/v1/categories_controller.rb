module Api
  module V1
    class CategoriesController < ApplicationController
      #before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :find_category, only: %i[show update destroy]
      before_action :authorize_category
      after_action :verify_authorized

      def index
        @categories = Category.all
        render json: convert_to_json(@categories)
      end

      def show
        render json: convert_to_json(@category)
      end

      def create
        @category = Category.new(category_params)
        @category.images.attach(params[:images])

        if @category.save!
          render json: convert_to_json(@category)
        else
          render json: errors(@category), status: :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          render json: convert_to_json(@category)
        else
          render json: errors(@category), status: :unprocessable_entity
        end
      end

      def destroy
        if @category.destroy
          render json: convert_to_json(@category)
        else
          render json: errors(@category), status: :unprocessable_entity
        end
      end

      private

      def category_params
        params.require(:category).permit(%i[name image_url])
      end

      def convert_to_json(object)
        CategorySerializer.new(object).serializable_hash.to_json
      end

      def find_category
        @category = Category.find(params[:id])
      end

      def error(object)
        { error: object.errors.full_messages }
      end

      def authorize_category
        authorize(@category || Category)
      end
    end
  end
end
