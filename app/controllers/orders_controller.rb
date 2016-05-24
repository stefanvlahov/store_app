class OrdersController < ApplicationController
  def create

    @order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      )

    car = @order.product
    @order.calculate_figures(car.price)

    @order.save

    flash[:success] = "Car Ordered!"
    redirect_to "/orders/#{ @order.id }"
  end

  def show
      @order = Order.find(params[:id])
      @product = Product.find(@order.product_id)
  end
end
