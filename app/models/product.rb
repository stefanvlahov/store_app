class Product < ActiveRecord::Base

  TAXRATE = 0.09

  def price_int
    price
  end

  def sale_message
    if price_int <= 25000
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    price_int * TAXRATE
  end

  def total_cost
    price_int + tax
  end

end
