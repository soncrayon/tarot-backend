class CardsController < ApplicationController

    def index
        @cards = Card.all
        return @cards.json
    end

end
