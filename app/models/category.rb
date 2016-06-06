class Category < ActiveRecord::Base

  validates :origin, uniqueness: true
  validates :origin, presence: true

  has_many :categorized_products
  has_many :products, through: :categorized_products
end
