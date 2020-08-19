class BandsController < ApplicationController
    before_action :authenticate_user!


    def index
        @bands = Band.all
    end


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
        @band = Band.find_by(id: params[:id])
    end

    def update
        @band = Band.find_by(id: params[:id])
        if @band.update_attributes(band_params)
            flash[:success] = "Band Updated!"
            redirect_to bands_path
        else
            flash[:alert] = "Something went wrong..."
            render edit_band_path
        end

    end

    def show
        @band = Band.find_by(id: params[:id])
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        @band.destroy
    end

    private
         
        def band_params
            params.permit(:name)
        end

        def authenticate
            if current_user.nil?
                flash[:alert] = "You must be logged in to perform that action."
                redirect_to new_session_path
            end
        end
end