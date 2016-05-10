class ProductsController < ApplicationController
  def selection
    @products = Product.all
  end
end
