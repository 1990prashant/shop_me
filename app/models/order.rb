class Order < ApplicationRecord

  has_many :line_items
  enum status: { created: 'Created', cancelled: 'Cancelled' }

  before_create :assign_number, :update_status

  def add_items(params)
    self.line_items.new(variant_id: params[:variant_id], item_count: params[:quantity], price: params[:price])
    self.save
  end

  def cancelable
    (Time.now - created_at) < 24.hours 
  end

  private

    def assign_number
      self.number = "SM-#{Time.now.sec * 1000}-#{SecureRandom.hex(3)}"
    end

    def update_status
      self.status = 'Created'
    end

end
