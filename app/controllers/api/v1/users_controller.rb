module Api
  module V1
    class UsersController < ApplicationController
      before_action :find_user, only: %i[show update destroy]

      def index
        users = User.paginate(page: params[:page])
        render json: users
        sorting = params[:sort]

        render json: User.order(sort_params.to_h) if sorting
        render json: Salon.all unless sorting
      end

      def show
        render json: @user
      end

      def create
        @user = User.new(user_params)

        if @user.save!
          render json: @user
        else
          render json: { error: 'Error creating user.' }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: { error: 'Error updating user.' }, status: :unprocessable_entity
        end
      end

      def destroy
        if @user.destroy
          render json: @user
        else
          render json: { error: 'Error deleting user.' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(%i[first_name last_name middle_name salon_id email work_email phone
                                        work_phone birthday role status notes image_url])
      end

      def find_user
        @user = User.find(params[:id])
      end
    end
  end
end
