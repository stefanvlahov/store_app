class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images, :foreign_key => "product_id"
  has_many :orders
  
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
