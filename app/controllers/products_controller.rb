class ProductsController < ApplicationController
  def index
    @cars = Product.all
  end

  def show
    @car = Product.find(params[:id])
  end

  def new

  end

  def create
    @car = Product.create(
      make: params[:make],
      model: params[:model],
      price: params[:price],
      description: params[:description],
      image: params[:image]
    )
    flash[:success] = "Car Created"
    redirect_to "/cars/#{ @car.id }"
  end

  def edit
    @car = Product.find_by(id: params[:id])
  end

  def update
    @car = Product.find_by(id: params[:id])

    @car.update(
    make: params[:make],
    model: params[:model],
    price: params[:price],
    description: params[:description],
    image: params[:image]
  )

  flash[:success] = "Car Updated"
  redirect_to "/cars/#{ @car.id }"
  end

  def destroy
    @car = Product.find(params[:id])
    @car.destroy

    flash[:warning] = "Car Destroyed"
    redirect_to "/"
  end

end
