class AlbumsController < ApplicationController

    def index
        if params.has_key?(:band_id)
            @albums = Album.where(band_id: params[:band_id])
        else
            @albums = Album.all
        end
    end

    def show
        @album = Album.find(params[:id])
        render album_path(@album)
    end

    def new
        @bands = Band.all
        @band = Band.find(params[:band_id])
        @album = Album.new
    end

    def create
        @band2 = @band
        @album = Album.new(album_params)
     
        if @album.valid?
            @album.band_id = Band.find_by(band_name: album_params[:album][:band_name]).id
            @album.save
            flash[:success] = "Album created"
            redirect_to albums_path
        else
            puts @album.errors.full_messages
            flash.now[:alert] = "#{@album.errors.full_messages.to_sentence}"
            redirect_to new_band_album_path(@band2)
        end

    end 

    private
        def album_params
            params.require(:album).permit(:title, :year, :band_id, :album_type, :band_name, :created_at, :updated_atm, :album)
        end

end