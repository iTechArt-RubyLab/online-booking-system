module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users
      end

      def show
        user
        if user
          render json: user
        else
          render json: { error: 'User not found.' }
        end
      end

      def create
        user
        if user.save!
          user = User.find_by(id: user.id)
          render json: user
        else
          render json: { error: 'Error creating user.' }, status: :unprocessable_entity
        end
      end

      def update
        user
        if user
          if user.update(user_params)
            user = User.find_by(id: user.id)
            render json: user
          else
            render json: { error: 'Error updating user.' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'User not found.' }, status: :not_found
        end
      end

      def destroy
        user
        if user
          if user.destroy
            render json: { message: 'User deleted.' }
          else
            render json: { error: 'Error deleting user.' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'User not found.' }, status: :not_found
        end
      end

      def user_params
        params.require(:user).permit(%i[first_name last_name patronymic salon_id email work_email phone
                                        work_phone birthday role status notes image_url])
      end

      def user
        @user ||= User.find_by(id: params[:id])
      end
      private :user_params, :user
    end
  end
end