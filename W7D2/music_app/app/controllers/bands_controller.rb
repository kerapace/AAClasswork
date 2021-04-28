class BandsController < ApplicationController
    def new
        render :new
    end

    def index
        @bands = Band.all
        render :index
    end

    def create
        band = Band.new(band_params)
        if band.save
            redirect_to band_url(band)
        else
            redirect_to bands_url
        end
    end

    def destroy
        band = Band.find_by(id: params[:id])
        if band.destroy
            redirect_to bands_url
        else
            redirect_to band_url(band)
        end
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def edit
        @band = Band.find_by(id: params[:id])
        if @band
            render :edit
        else
            redirect_to bands_url
        end
    end

    def update
        @band = Band.find_by(id: params[:id])
        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    private
    def band_params
        params.require(:band).permit(:band_name,:formation_year,:location)
    end
end
