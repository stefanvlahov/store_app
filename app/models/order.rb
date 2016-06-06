class Order < ActiveRecord::Base

  validates :user_id, presence: true

  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  TAXRATE = 0.09

  def calculate_subtotal(cart_items)
    self.subtotal = 0
    cart_items.each do |cart_item|
      self.subtotal += cart_item.product.price * cart_item.quantity
    end
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
