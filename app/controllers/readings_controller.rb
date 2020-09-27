class ReadingsController < ApplicationController
    
    before_action :set_reading, only: [:show, :destroy]

    def index 
        render json: Reading.all
    end

    def create
        reading = Reading.new({date_time_created: Time.now.strftime('%a %d %b %Y, %l:%M %p'), user_id: reading_params[:user_id]})
        if reading.save 
            render json: reading
        else
            render json: 'error'
        end
    end

    def show_loggedin_user_readings
        readings = User.find(params[:id]).readings
        render json: readings 
        
    end

    def show 
       render json: @reading.cards
    end

    def destroy
        if @reading.destroy
            render json: @user.readings
        else 
            render json:'error'
        end 
    end

    private

    def reading_params
        params.require(:reading).permit(:user_id)
    end

    def set_reading
        @reading = Reading.find(params[:id])
        @user = User.find(@reading.user_id)
    end

end