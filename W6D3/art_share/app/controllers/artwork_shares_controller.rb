class ArtworkSharesController < ApplicationController


    def create
        if ArtworkShare.find_by(artist_id: params[:artist_id], viewer_id: params[:viewer_id]).nil?
            share = ArtworkShare.new(params.require(:artwork_share).permit(:artist_id, :viewer_id))
            if share.save
                render json: share
            else
                render json: share.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        if !ArtworkShare.find_by(artist_id: params[:artist_id], viewer_id: params[:viewer_id]).nil?
            share = ArtworkShare.new(params.require(:artwork_share).permit(:artist_id, :viewer_id))
            if share.destroy
                render json: share
            else
                render json: share.errors.full_messages, status: :unprocessable_entity
            end
        end
    end
end