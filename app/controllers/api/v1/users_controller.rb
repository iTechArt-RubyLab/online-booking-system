module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users
      end

      def show
        user = User.find_by(id: params[:id])
        if user
          render json: user
        else
          render json: { error: 'User not found.' }
        end
      end

      def create
        user = User.new(
          first_name: user_params[:first_name],
          last_name: user_params[:last_name],
          patronymic: user_params[:patronymic],
          salon_id: user_params[:salon_id],
          email: user_params[:email],
          work_email: user_params[:work_email],
          phone: user_params[:phone],
          work_phone: user_params[:work_phone],
          birthday: user_params[:birthday],
          role: user_params[:role],
          status: user_params[:status],
          notes: user_params[:notes]
        )
        if user.save!
          user = User.find_by(id: user.id)
          render json: user
        else
          render json: { error: 'Error creating user.' }, status: :unprocessable_entity
        end
      end

      def user_params
        params.require(:user).permit(%i[first_name last_name patronymic salon_id email work_email phone
                                        work_phone birthday role status notes])
      end
      private :user_params
    end
  end
end
