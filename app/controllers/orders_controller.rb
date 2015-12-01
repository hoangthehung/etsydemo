class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /orders
  # GET /orders.json
  def sales
    @orders = Order.all.where(seller: current_user.id).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user.id).order("created_at DESC")
  end

  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    puts "got here"
    @order = Order.new
    @shopping_cart = params[:carts]
  end

  

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    shopping_cart = ShoppingCart.find(params[:carts])

    

    @order.buyer_id = current_user.id
    @order.shopping_cart = shopping_cart
    @order.seller_id = shopping_cart.shopping_cart_items.first.item.user.id

    respond_to do |format|
      if @order.save
        create_new_shopping_cart
        format.html { redirect_to root_url  , notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
    def remove_item_cart

    end
    def create_new_shopping_cart
      @shopping_cart = ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
    end
end
