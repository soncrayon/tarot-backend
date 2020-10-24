class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy, :user_arcana_percentages, :user_orientation_percentages, :user_highest_arcana_percentage, :user_highest_orientation_percentage] 
  
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
          signup_errors: @user.errors.full_messages
        }
      end
    end

    def update
      update_params = user_params.select{ |k, v| !v.empty? }
      update_params.each { |k, v| 
        update_item = Hash[k, v]
        @user.update(update_item)
      }
      render json: {
        status: "updated",
        user: @user
      }
    end

    def destroy  
      if @user.destroy 
          render json: {
            status: "deleted"
          }
        else
          render json: {
            status: 500,
            errors: "user not deleted"
          }
        end
    end

    def user_arcana_percentages
      render json: @user.arcana_percentages_for_current_user
    end

    def all_arcana_percentages
      render json: User.arcana_percentages_for_all_users
    end

    def user_orientation_percentages
      render json: @user.orientation_percentages_for_current_user
    end

    def all_orientation_percentages
      render json: User.orientation_percentages_for_all_users
    end

    def user_highest_arcana_percentage
      render json: {highest: @user.highest_arcana_percentage_for_current_user}
    end

    def all_highest_arcana_percentage
      render json: {highest: User.highest_arcana_percentage_for_all_users}
    end

    def user_highest_orientation_percentage
      render json: {highest: @user.highest_orientation_percentage_for_current_user}
    end

    def all_highest_orientation_percentage
      render json: {highest: User.highest_orientation_percentage_for_all_users}
    end

    private
      
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end


end
