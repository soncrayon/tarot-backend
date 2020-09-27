class CardsController < ApplicationController
    
    def index 
        render json: Card.all
    end

    def create
       card_params.to_h.select {|key, val| val.class != Integer}.map { |period, card| 
        @card = Card.new(card)
        @card['reading_id'] = card_params[:reading_id].to_s
        @card.save 
        }
        render json: @card.reading.user.readings
    end

    private

    def card_params
        attribute_array = [:period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation]
        params.require(:card).permit(:reading_id, :past => attribute_array, :present => attribute_array, :future => attribute_array)
    end

end
