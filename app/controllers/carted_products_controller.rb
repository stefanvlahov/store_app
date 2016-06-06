class CartedProductsController < ApplicationController

  before_action :authenticate_user!

  def index
    if user_signed_in? && current_user.carted_items.count > 0
      @cart = current_user.carted_items
    else
      flash[:info] = "No Items in Cart. Please sign in or add items to cart first!"
      redirect_to "/"
    end
  end

  def create

    @carted_car = CartedProduct.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      status: "carted"
      )

      @carted_car.save

      session[:cart_count] = nil
      flash[:success] = "Added to Cart!"
      redirect_to "/cart"
    end

    def destroy
      @carted_car = CartedProduct.find(params[:id])
      @carted_car.update(status: "removed")

      session[:cart_count] = nil
      flash[:success] = "Removed Item"
      redirect_to "/cart"
    end

end
