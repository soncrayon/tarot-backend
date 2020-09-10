class CardsController < ApplicationController

    before_action :create_reading, only: [:create]
    before_action :set_reading_cards, only: [:destroy]
    
    def index 
        render json: Card.all
    end

    def create
       render json: card_params.to_h.map { |period, card| 
        @card = Card.new(card)
        @card['reading_id'] = @reading.id 
        @card.save 
        }
    end

    def destroy
       @cards.destroy_all
    end

    private

    def card_params
        
        params.require(:card).permit(:past => [:period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id],
        :present => [:period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id],
        :future => [:period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id])
        
    end

    def set_card
        @card = Card.find(params[:id])
    end

    def set_reading_cards
        @cards = Card.where(id: params[:id].split(','))
    end

    def create_reading
        @reading = Reading.create({date_time_created: Time.now.strftime('%a %d %b %Y, %l:%M %p')})
    end

end
