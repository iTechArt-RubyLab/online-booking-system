module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      attr_accessor :user

      def search
        render json: User.search(search_params[:info]).records.to_a
      end

      def index
        @users =
          if params[:sort]
            User.order(User::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            User.paginate(page: params[:page], per_page: 15)
          end
        render json: @users
      end

      def sort_params
        params.require(:sort).permit(salon_columns)
      end

      def salon_columns
        Salon.column_names.map(&:to_s)
      end

      def show
        render json: user
      end

      def create
        user = User.new(user_params)
        user.avatar.attach(params[:avatar])

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

      def search_params
        params.require(:search).permit(:info)
      end

      def user_params
        params.require(:user).permit(%i[first_name last_name middle_name salon_id email work_email phone
                                        work_phone birthday role status notes avatar])
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
