class ArtworkSharesController < ApplicationController


    def create
        if ArtworkShare.find_by(params.require(:artwork_share).permit(:artwork_id, :viewer_id)).nil?
            share = ArtworkShare.new(params.require(:artwork_share).permit(:artwork_id, :viewer_id))
            if share.save
                render json: share
            else
                render json: share.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        share = ArtworkShare.find_by(params.require(:artwork_share).permit(:artwork_id, :viewer_id))
        if !share.nil?
            if share.destroy
                render json: share
            else
                render json: share.errors.full_messages, status: :unprocessable_entity
            end
        end
    end
end