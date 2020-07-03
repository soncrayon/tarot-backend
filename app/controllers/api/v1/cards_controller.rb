class Api::V1::CardsController < ApplicationController

    def index
        @cards = Card.all
        return @cards.json
    end

end
