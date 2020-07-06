class UsersController < ApplicationController
    
    before_action :set_user, only: [:show, :destroy]
    
    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)
            if @user.save
                render json: @user
            else
                render json: {error: 'Error saving card'}
            end 
    end

    def show 
       render json: @user
    end

    def destroy
        @user.destroy 
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name)
    end

    def set_user 
        @user = User.find(params[:id])
    end

end
