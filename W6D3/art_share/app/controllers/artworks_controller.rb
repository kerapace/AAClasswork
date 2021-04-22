class ArtworksController < ApplicationController
    def index
        artwork = Artwork.all
        render json: artwork
        # render plain: "I'm in the index action!"

        
    end

    def create
       artwork = Artwork.new(params.require(:artwork).permit(:title, :image_url, :artist_id)) 
       if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        render json: artwork
    end

   def update
         artwork =  Artwork.find_by(id: params[:id])

        if artwork.update(params.require(:artwork).permit(:title, :image_url, :artist_id))
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: 422
        end
   end

   def destroy
        artwork =  Artwork.find_by(id: params[:id])
        if artwork.destroy
            redirect_to "/artworks"
        else
            render json: artwork.errors.full_messages, status: 422
        end
   end

end