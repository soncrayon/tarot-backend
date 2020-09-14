class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy, :user_suit_percentages, :user_orientation_percentages] 
  
    def index
      render json: User.all 
    end

    def show
      render json: @user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        login!
        render json: {
          status: "created",
          user: @user
        }
      else 
        render json: {
          status: 500,
          errors: @user.errors.full_messages
        }
      end
    end

    def update
      if @user.update(first_name: user_params[:first_name], last_name: user_params[:last_name], email: user_params[:email], password:user_params[:password])
        render json: {
          status: "updated",
          user: @user
        } 
      else
        render json: {
          status: 500, 
          errors: @user.errors.full_messages
        }
      end
    end

    def user_suit_percentages
      render json: @user.suit_percentages_for_current_user
    end

    def all_suit_percentages
      render json: User.suit_percentages_for_all_users
    end

    def user_orientation_percentages
      render json: @user.orientation_percentages_for_current_user
    end

    def all_orientation_percentages
      render json: User.orientation_percentages_for_all_users
    end

    private
      
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end


end
