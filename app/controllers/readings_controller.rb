class ReadingsController < ApplicationController
    
    before_action :set_reading, only: [:show, :destroy]
    
    def index 
        @readings = Reading.all
        render json: @readings
    end

    def create
        @reading = Reading.new(reading_params)
            if @reading.save
                render json: @reading
            else
                render json: {error: 'Error saving reading'}
            end 
    end

    def show 
       render json: @reading.cards 
    #    instead of showing the reading here, we can show the reading's cards 
    end

    def destroy
        @reading.destroy 
    end

    private

    def reading_params
        params.require(:reading)
        # need to add name attribute to the reading model, right now it's just the date
    end

    def set_reading 
        @reading = Reading.find(params[:id])
    end

    

end