class BandsController < ApplicationController

    def new 
        @band = Band.new
    end

    def create
        @band = Band.new(band_params)
        if @band.valid?
            @band.save
            redirect_to band_path(@band)
        else
            flash.now[:error] = "Please ensure all fields are filled out."
            render new_band_path
        end
    end

    def edit
        @band = band.find_by(id: params[:id])
    end

    def show
        @band = band.find_by(id: params[:id])
    end

    def destroy
        @band = band.find_by(id: params[:id])
        @band.destroy
    end

    private
         
        def band_params
            params.require(:band).permit(:name)
        end

end