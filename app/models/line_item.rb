class LineItem < ApplicationRecord
  belongs_to :variant

  def item_name
    variant.product.name
  end

  def item_description
    variant.product.description
  end
  
end
