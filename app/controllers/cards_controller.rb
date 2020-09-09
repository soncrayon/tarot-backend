class CardsController < ApplicationController

    before_action :create_reading, only: [:create]
    before_action :set_card, only: [:show, :destroy]
    
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

    def show 
       render @card.to_json
    end

    def destroy
        byebug
        card_params.to_h.map { |period, card| 
            card.destroy
        }
        @reading_to_delete.destroy 
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

    def create_reading
        @reading = Reading.create({date_time_created: Time.now.strftime('%a %d %b %Y, %l:%M %p')})
    end

    def set_reading
        @reading_to_delete = Reading.find(params[:id])
    end

end
