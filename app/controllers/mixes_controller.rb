class MixesController < ApplicationController
  before_action :set_mix, only: [:show, :edit, :update, :destroy]
  before_action :original_url
  before_action :authenticate_user!, except: [:show]

  # GET /mixes
  # GET /mixes.json
  def index
    # @mixes = Mix.all
    # @user = User.find(params[:user_id])
    # @mixes = @user.mixes
    @mixes = current_user.mixes
  end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
    # @song = @mix.songs.find(params[:id])
    @songs = Song.all
  end

  # GET /mixes/new
  def new
    @mix = current_user.mixes.build
  end

  # GET /mixes/1/edit
  def edit
  end

  # POST /mixes
  # POST /mixes.json
  def create
    @mix = current_user.mixes.build(mix_params)

    respond_to do |format|
      if @mix.save
        format.html { redirect_to @mix, notice: 'Mix was successfully created.' }
        format.json { render :show, status: :created, location: @mix }
      else
        format.html { render :new }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mixes/1
  # PATCH/PUT /mixes/1.json
  def update
    respond_to do |format|
      if @mix.update(mix_params)
        format.html { redirect_to @mix, notice: 'Mix was successfully updated.' }
        format.json { render :show, status: :ok, location: @mix }
      else
        format.html { render :edit }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixes/1
  # DELETE /mixes/1.json
  def destroy
    @mix.destroy
    respond_to do |format|
      format.html { redirect_to mixes_url, notice: 'Mix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mix
      @mix = Mix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mix_params
      params.require(:mix).permit(:id, :title, :description)
    end

    def original_url
      @share_url = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
    end
end
