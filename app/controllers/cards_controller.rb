class CardsController < ApplicationController

    before_action :set_reading, :set_user, only: [:create, :show, :destroy]
    before_action :set_card, only: [:show, :destroy]
    # don't know if the before_action helper methods need to be set out separately 
    # before_action :set_reading
    
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
        @card.destroy 
    end

    private

    def card_params
        
        params.require(:card).permit(:id, :period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id)

        # make sure to update the frontend to reflect the newly-named card attributes 
        # params.require(:card).permit(:past => [:id, :period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id],
        # :present => [:id, :period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id],
        # :future => [:id, :period, :name, :full_meaning, :upright_meaning, :reversed_meaning, :image, :orientation, :reading_id, :user_id])
        
    end

    def set_card
        @card = Card.find(params[:id])
    end

    def set_reading
        # the below is not giving me what I need in terms of format (maybe just get raw timestamp then handle on frontend?)
        # now = Time.new.strftime("%a, %B %d, %Y at %I:%M %p")
        @reading = Reading.create
    end

    def set_user
        # temporary for seed data
        @user = User.first
    end

end
