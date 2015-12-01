class ListingsController < ApplicationController
  include ListingsHelper
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  
  # def translate_listing
  #   puts '********  translate actions ***'
  #   name = params[:name]
  #   puts name
  #   @listings = translateListing(@listing, 'vi')
  #   render 'edit'
  #   puts '*******************************'
  # end
  # GET /listings
  # GET /listings.json
  def index
    @listings_scope = Listing.order(created_at: :desc).all
    @listings = Kaminari.paginate_array(@listings_scope).page(params[:page]).per(12)
  end

  def seller
    @listings_seller = Listing.order(created_at: :desc).all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end
  

  # GET /listings/new
  def new
    @listing = Listing.new
    @catesLevel1 = Category.order("LENGTH(name) DESC").all
  end

  # GET /listings/1/edit
  def edit

    @catesLevel1 = Category.order("LENGTH(name) DESC").all
    
  end

  def updateCate

  end
  # POST /listings
  # POST /listings.json
  def create
    if params[:translate_btn]
      puts "translate"
      @listing = Listing.new(listing_params)
      @listing.user_id = current_user.id
      @listing = translateListing(@listing, 'vi')
      @catesLevel1 = Category.order("LENGTH(name) DESC").all
      render :action => 'edit'
    else
    @catesLevel1 = Category.order("LENGTH(name) DESC").all
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    puts "got edit listing"
    puts params[:translate_btn]
    puts params[:submit_btn]
    if params[:translate_btn]
      puts "translate"
      @listings = translateListing(@listing, 'vi')
      @catesLevel1 = Category.order("LENGTH(name) DESC").all
      render :action => 'edit'
    else

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :image, :category_ids => [])
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry that this listing belongs to another"
      end
    end
    
end
