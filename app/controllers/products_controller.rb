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
      description: params[:description]
    )
    render "show.html.erb"
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
    description: params[:description]
  )

  render "show.html.erb"
  end
end
