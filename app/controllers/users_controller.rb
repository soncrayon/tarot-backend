class UsersController < ApplicationController

  before_action :set_user, only: [:show, :destroy] 
  
  def index
        
      render json: User.all 
      # @users = User.all
        # if @users
        #   render json: {
        #     users: @users
        #   }
        # else
        #   render json: {
        #     status: 500,
        #     errors: ['no users found']
        #   }
        # end
    end

    def show
      render json: @user
      #   @user = User.find(params[:id])
      #  if @user
      #     render json: {
      #       user: @user
      #     }
      #   else
      #     render json: {
      #       status: 500,
      #       errors: ['user not found']
      #     }
      #   end
      end

      def create
        @user = User.new(user_params)
        if @user.save
          login!
          render json: {
            #   make sure to understand what the :created key is referring to in the below 
            status: :created,
            user: @user
          }
        else 
          render json: {
            status: 500,
            errors: @user.errors.full_messages
          }
        end
      end

    private
      
      # I removed "password_confirmation" from the below so make the same change on frontend

      def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
      end

      def set_user
        @user = User.find(params[:id])
      end


end
