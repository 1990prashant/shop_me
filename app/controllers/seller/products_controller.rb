class Seller::ProductsController < Seller::StoreController

  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def edit
    @product.variants.build
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to edit_seller_product_url(@product.slug), notice: 'Product successfully created'
    else
      flash[:error] = @product.errors.full_messages.join('<br/>')
      render action: :new
    end
  end

  def update
    if @product.update_attributes product_params
      redirect_to edit_seller_product_url(@product.slug), notice: 'Product updated successfully'
    else
      flash[:error] = @product.errors.full_messages.join('<br/>')
      render action: :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to seller_products_url, notice: 'Product deleted successfully'
  end

  private

    def product_params
      params.require(:product).permit(:name, :slug, :base_price, variants_attributes: [:id, :color, :price, :product_id, :count_on_hand])
    end

    def find_product
      @product = current_user.products.find_by_slug(params[:id])
      if @product.blank?
        redirect_to seller_products_url, notice: 'Product not found'
      end
    end
end