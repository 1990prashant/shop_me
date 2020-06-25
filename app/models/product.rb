class Product < ApplicationRecord

  before_create :add_slug
  
  has_many :variants

  accepts_nested_attributes_for :variants

  def image_url
    '/images/no-image.png'
  end

  private

    def add_slug
      self.slug = self.name.downcase.split(' ').join('-')
    end
end
