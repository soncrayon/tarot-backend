class CardsController < ApplicationController
    
    def index 
        render json: Card.all
    end

    def create
       card_params.to_h.select {|key, val| val.class != Integer}.map { |period, card_attributes| 
        card = Card.new(card_attributes)
        card['reading_id'] = card_params[:reading_id].to_s
        card.save 
        }
        render json: card.reading.user.readings
    end

    private

    def card_params
        card_attributes = [:period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation]
        params.require(:card).permit(:reading_id, :past => card_attributes, :present => card_attributes, :future => card_attributes)
    end

end
