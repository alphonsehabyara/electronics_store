class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images

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
