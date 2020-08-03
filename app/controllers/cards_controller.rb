class CardsController < ApplicationController

    before_action :set_card, only: [:show, :destroy]
    before_action :set_reading
    
    def index
        @cards = Card.all
        return @cards.to_json
    end

    def create
       render card_params.to_h.map { |period, card| 
        @card = Card.new(card)
        @card['reading_id'] = @reading.id 
        @card.save 
        }.to_json
    end

    def show 
       return @card.to_json
    end

    def destroy
        @card.destroy 
    end

    private

    def card_params
        params.require(:card).permit(:past => [:period, :card_name, :card_full_meaning, :card_upright, :card_reversed, :card_image, :card_orientation, :reading_id],
        :present => [:period, :card_name, :card_full_meaning, :card_upright, :card_reversed, :card_image, :card_orientation, :reading_id],
        :future => [:period, :card_name, :card_full_meaning, :card_upright, :card_reversed, :card_image, :card_orientation, :reading_id])
    end

    def set_card
        @card = Card.find(params[:id])
    end

    def set_reading
        @reading = Reading.create 
    end

end
