class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  # validates :description, presence: true
  validates :price, numericality: {greater_than: 0}

  def self.discounted_products
    Product.where("price < ?", 50)
  end

  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def tax
    tax = price*0.09
    tax.round(2)
  end 

end
