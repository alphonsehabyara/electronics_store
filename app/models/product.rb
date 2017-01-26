class Product < ApplicationRecord

  def friendly_created_at
    created_at.strftime("%H:%M on %d-%m-%Y")
  end

  def friendly_updated_at
    updated_at.strftime("%H:%M on %d-%m-%Y")
  end

  def tax
    price*0.09
  end 

end
