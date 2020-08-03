class ReadingsController < ApplicationController
    
    before_action :set_reading, only: [:show, :destroy]
    
    def index 
        @readings = Reading.all
        render json: @readings
    end

    def show 
       render json: @reading.cards 
    end

    def destroy
        @reading.destroy 
    end

    private

    def set_reading 
        @reading = Reading.find(params[:id])
    end

    

end