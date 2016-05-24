class Order < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  TAXRATE = 0.09

  def calculate_subtotal(price)
    self.subtotal = price * quantity
  end

  def calculate_tax
    self.tax = subtotal * TAXRATE
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def calculate_figures(price)
    calculate_subtotal(price)
    calculate_tax
    calculate_total
  end

end
