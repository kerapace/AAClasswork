class ArtworkSharesController < ApplicationController


    def create
        artwork_share.find_by(artist_id: params[:artist_id])
        
    end
end