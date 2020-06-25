class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :current_order, only: :populate
  before_action :find_order, only: [:edit, :update]
  
  def index
    @orders = current_user.orders
  end

  def edit
  end

  def populate
    if @current_order.add_items(params)
      session[:order_id] = @current_order.number
      redirect_to orders_url, notice: 'Item successfully added into cart'
    else
      redirect_to root_url, notice: 'Something went wrong'
    end
  end

  def update
    if @order.update_column(:status, Order.statuses[:cancelled])
      redirect_to orders_url, notice: 'Order successfully cancelled'
    else
      redirect_to orders_url, notice: @order.errors.full_messages.join('<br/>')
    end
  end

  private

    def current_order
      if session[:order_id].present?
        @current_order ||= current_user.orders.find_by_number(session[:order_id])
      else
        @current_order ||= current_user.orders.new
      end
    end

    def find_order
      @order = current_user.orders.find_by_number(params[:id])
      if @order.blank?
        redirect_to root_url, notice: 'Order not found'
      end
    end

end