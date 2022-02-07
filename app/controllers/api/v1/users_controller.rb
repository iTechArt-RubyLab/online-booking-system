module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :find_user, only: %i[show update destroy]
      before_action :authorize_user
      after_action :verify_authorized

      def search
        users = User.search(search_params[:info]).records.to_a
        render json: convert_to_json(users)
      end

      def index
        @users =
          if params[:sort]
            User.order(User::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            User.paginate(page: params[:page], per_page: 15)
          end

        render json: convert_to_json(@users)
      end

      def show
        render json: convert_to_json(@user)
      end

      def create
        @user = User.new(user_params)
        @user.avatar.attach(params[:avatar])

        if @user.save!
          render json: convert_to_json(@user)
        else
          render json: convert_to_json(errors(@user)), status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: convert_to_json(@user)
        else
          render json: convert_to_json(errors(@user)), status: :unprocessable_entity
        end
      end

      def destroy
        if @user.destroy
          render json: convert_to_json(@user)
        else
          render json: convert_to_json(errors(@user)), status: :unprocessable_entity
        end
      end

      private

      def search_params
        params.require(:search).permit(:info)
      end

      def user_params
        params.require(:user).permit(%i[first_name last_name middle_name salon_id email work_email phone
                                        work_phone birthday role status notes avatar password])
      end

      def convert_to_json(object)
        UserSerializer.new(object).serializable_hash.to_json
      end

      def find_user
        @user = User.find(params[:id])
      end

      def authorize_user
        authorize @user
      end
    end
  end
end
