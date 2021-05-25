class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
    render :index 
  end

  def show
    
  end
end
