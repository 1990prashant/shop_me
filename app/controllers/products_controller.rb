class ProductsController < ApplicationController

  before_action :find_product, only: [:show]

  def show
  end

  private

    def find_product
      @product = Product.where(slug: params[:id]).includes(:variants).first
      if @product.blank?
        redirect_to root_url, notice: 'Product not found'
      end
    end
end