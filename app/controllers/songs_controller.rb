class SongsController < ApplicationController
  before_action :set_mix
  before_action :set_song, only: [:show, :edit, :update, :destroy, :index]

  # GET /songs
  # GET /songs.json
  def index
    @songs = @mix.songs
  end

  # GET /songs/1
  # GET /songs/1.json
  def show

  end

  # GET /songs/new
  def new
    @mix = Mix.find(params[:mix_id])
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit

  end

  # POST /songs
  # POST /songs.json
  def create
    @song = @mix.songs.create(song_params)
    @song.link = @song.parse_video_url(@song.link)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @mix, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @mix, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to @mix, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_mix
      @mix = Mix.find(params[:mix_id])
    end
    def set_song
      @song = @mix.songs.find(params[:id])
      @songs = Song.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:id, :artist, :title, :link, :mix_id)
    end
end
