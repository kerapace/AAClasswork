class AlbumsController < ApplicationController
    def new
        render :new
    end

    def index
        @albums = Album.joins(:band).order('band_name ASC').all.includes(:band)
        render :index
    end

    def create
        album = Album.new(album_params)
        album.band_id = params[:band_id]
        if album.save
            redirect_to album_url(album)
        else
            redirect_to albums_url
        end
    end

    def destroy
        album = Album.find_by(id: params[:id])
        if album.destroy
            redirect_to albums_url
        else
            redirect_to album_url(band)
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def edit
        @album = Album.find_by(id: params[:id])
        if @album
            render :edit
        else
            redirect_to albums_url
        end
    end

    def update
        @album = Album.find_by(id: params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            render :edit
        end
    end

    private
    def album_params
        params.require(:album).permit(:title,:year,:recording_type)
    end
end