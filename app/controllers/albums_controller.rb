class AlbumsController < ApplicationController

    def index
        @albums = Album.all
        render :index
    end

    def edit
        @album = Album.find(params[:id])
        @band = Band.find_by(id: @album.band_id)
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        @album.update(album_params)
        redirect_to album_path(@album)
    end

    def show
        @album = Album.find(params[:id])
        @tracks = @album.tracks
        @band = Band.find_by(id: @album.band_id)
        render :show
    end

    def new
        @band = Band.find_by(id: params[:band_id])
        @album = Album.new(band_id: params[:band_id])
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.valid?
            puts @album.errors.full_messages
            @album.save
            flash[:success] = "Album created"
            redirect_to album_path(@album)
        else
            puts @album.errors.full_messages
            flash.now[:alert] = "#{@album.errors.full_messages.to_sentence}"
            render :new
        end

    end 

    def destroy
        album = Album.find(params[:id])
        album.destroy
        redirect_to albums_path
    end

    private
        def album_params
            params.require(:album).permit(:title, :year, :band_id, :album_type, :created_at, :updated_at)
        end

end