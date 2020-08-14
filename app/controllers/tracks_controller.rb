class TracksController < ApplicationController

    def new
        @album = Album.find_by(id: params[:album_id])
        @track = Track.new(album_id: params[:album_id])
    end

    def create
        @album = Album.find_by(id: track_params[:album_id])
        @track = Track.new(track_params)
        if @track.valid?
            @track.save
            redirect_to album_path(@album)
        else
            flash.now[:error] = @track.errors.full_messages.to_sentence
            render 'new'
        end
    end

    def show
        @track = Track.find_by(id: params[:id])
        @album = Album.find_by(id: @track.album_id)
        render 'show' 
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render 'edit'
    end

    def update
        @album = Album.find_by(id: params[:album_id])
        @track = Track.update(track_params)
        redirect_to album_path(@album)
    end

    def destroy
        @album = Album.find_by(id: params[:album_id])
        track = Track.find_by(id: params[:id])
        track.destroy
        redirect_to album_path(@album)
    end

    private 
        def track_params
            params.require(:track).permit(:title, :track_number, :lyrics, :album_id, :track_type)
        end


end