class EditorPicksController < ApplicationController
  before_action :set_editor_pick, only: [:show, :edit, :update, :destroy]

  # GET /editor_picks
  # GET /editor_picks.json
  def index
    @editor_picks = EditorPick.all
  end

  # GET /editor_picks/1
  # GET /editor_picks/1.json
  def show
  end

  # GET /editor_picks/new
  def new
    @editor_pick = EditorPick.new
    
  end

  # GET /editor_picks/1/edit
  def edit
  end

  # POST /editor_picks
  # POST /editor_picks.json
  def create
    @editor_pick = EditorPick.new(editor_pick_params)

    respond_to do |format|
      if @editor_pick.save
        format.html { redirect_to @editor_pick, notice: 'Editor pick was successfully created.' }
        format.json { render :show, status: :created, location: @editor_pick }
      else
        format.html { render :new }
        format.json { render json: @editor_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editor_picks/1
  # PATCH/PUT /editor_picks/1.json
  def update
    respond_to do |format|
      if @editor_pick.update(editor_pick_params)
        format.html { redirect_to @editor_pick, notice: 'Editor pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @editor_pick }
      else
        format.html { render :edit }
        format.json { render json: @editor_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editor_picks/1
  # DELETE /editor_picks/1.json
  def destroy
    @editor_pick.destroy
    respond_to do |format|
      format.html { redirect_to editor_picks_url, notice: 'Editor pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor_pick
      @editor_pick = EditorPick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_pick_params
      params.require(:editor_pick).permit(:name, :image, :onTop, :description, :listing_ids => [])
    end
end
