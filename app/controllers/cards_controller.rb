class CardsController < ApplicationController

    before_action :set_card, only: [:show, :destroy]
    
    def index 
        @cards = Card.all
        render json: @cards
    end

    def create
        @card = Card.new(card_params)
            if @card.save
                render json: @card
            else
                render json: {error: 'Error saving card'}
            end 
    end

    def show 
       render json: @card
    end

    def destroy
        @card.destroy 
    end

    private

    def card_params
        params.require(:card).permit(:title, :image, :description)
    end

    def set_card 
        @card = Card.find(params[:id])
    end

end
