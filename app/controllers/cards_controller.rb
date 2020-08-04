class CardsController < ApplicationController

    before_action :set_card, only: [:show, :destroy]
    before_action :set_reading
    
    def index
        render Card.all.to_json
    end

    def create
       render json: card_params.to_h.map { |period, card| 
        @card = Card.new(card)
        @card['reading_id'] = @reading.id 
        @card.save 
        }
    end

    def show 
       render @card.to_json
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
        now = Time.new.strftime("%a, %B %d, %Y at %I:%M %p")
        @reading = Reading.create({date: now})
    end

end
