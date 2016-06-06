class ProductsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index

    @cars = Product.all
    attribute = params[:sort]
    sort_order = params[:sort_order]
    discount = params[:discount]
    search_term = params[:search_term]
    category_type = params[:category]

    if category_type
      @cars = Category.find_by(origin: category_type).products
    end

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
    @car = Product.new

  end

  def create
    @car = Product.create(
      make: params[:make],
      model: params[:model],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @car.save
      Image.create(url: params[:image], product_id: @car.id) if params[:image] != ""

      flash[:success] = "Car Created"
      redirect_to "/cars/#{ @car.id }"
    else
      render :new
    end
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
    supplier_id: params[:supplier_id]
  )

    if @car.save
      flash[:success] = "Car Updated"
      redirect_to "/cars/#{ @car.id }"
    else
      render :edit
    end

  end

  def destroy
    @car = Product.find(params[:id])
    @car.destroy

    flash[:warning] = "Car Destroyed"
    redirect_to "/"
  end

end
