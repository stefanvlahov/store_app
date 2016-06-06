class Product < ActiveRecord::Base

  validates :make, presence: true
  validates :make, uniqueness: true

  validates :description, presence: true
  validates :description, length: { maximum: 200 }

  validates :price, numericality: true
  validates :price, presence: true
  validates :price, format: {with: /\A\d+(?:\.\d{0,2})?\z/, message: "must be a price"}


  belongs_to :supplier
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :images, :foreign_key => "product_id"
  has_many :carted_products
  has_many :orders, through: :carted_products

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

  def image_preview_url
    main_img = images.first
    main_img.image_url
  end

end
