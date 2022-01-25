module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      attr_accessor :user

      def index
        if params[:sort]
          sort_params = params[:sort]

          if sort_params[:first_name]
            sort_field = :first_name
            sort_order = sort_params[:first_name]
          elsif sort_params[:last_name]
            sort_field = :last_name
            sort_order = sort_params[:last_name]
          elsif sort_params[:patronymic]
            sort_field = :patronymic
            sort_order = sort_params[:patronymic]
          elsif sort_params[:email]
            sort_field = :email
            sort_order = sort_params[:email]
          end
          @users = User.order(sort_field => sort_order)
          render json: @users
        else
          users = User.all
          render json: users
        end
      end

      def show
        render json: user
      end

      def create
        user = User.new(user_params)

        if user.save!
          render json: user
        else
          render json: { error: 'Error creating user.' }, status: :unprocessable_entity
        end
      end

      def update
        if user.update(user_params)
          render json: user
        else
          render json: { error: 'Error updating user.' }, status: :unprocessable_entity
        end
      end

      def destroy
        if user.destroy
          render json: user
        else
          render json: { error: 'Error deleting user.' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(%i[first_name last_name middle_name salon_id email work_email phone
                                        work_phone birthday role status notes image_url])
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
