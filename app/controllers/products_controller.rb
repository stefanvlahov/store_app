class ProductsController < ApplicationController
  def index
    @cars = Product.all
    attribute = params[:sort]
    sort_order = params[:sort_order]
    discount = params[:discount]
    search_term = params[:search_term]

    if discount
      @cars = Product.where("price <= ?", discount)
    end

    if sort_order && attribute
      @cars = @cars.order(attribute => sort_order)
    elsif attribute
      @cars = @cars.order(attribute)
    end

    if search_term
      @cars = @cars.where("make LIKE ? model LIKE ? description LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end

  end

  def show
    car_id = params[:id]

    if car_id == "random"
      @car = Product.all.sample
    else
      @car = Product.find(params[:id])
    end
  end

  def new

  end

  def create
    @car = Product.create(
      make: params[:make],
      model: params[:model],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      supplier_id: params[:supplier_id]
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
    image: params[:image],
    supplier_id: params[:supplier_id]
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
