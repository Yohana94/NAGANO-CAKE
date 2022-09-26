class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @total = 0
    @cart_items = current_customer.cart_items
    # @order = Order.new(order_params)
    @order = current_customer.orders.new(order_params)
      if params[:order][:select_address] == "1"
        @order.post_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.address_name = current_customer.first_name + current_customer.last_name
      elsif params[:order][:select_address] == "2"
        @address = Address.find(params[:order][:address_id])
        @order.address_name = @address.name
        @order.address = @address.address
      end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |f|
    order_detail = OrderDetail.new
    order_detail.order_id = @order.id
    order_detail.item_id = f.item.id
    order_detail.price = f.item.price
    order_detail.amount = f.amount
    order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path

  end

  def index
    @orders = current_customer.orders
    @order_detail = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_new = Order.new
    @orders = current_customer.orders
  end

     private
  def order_params
  params.require(:order).permit(:method_of_payment, :post_code, :address, :address_name, :accounting_amount)
  end

  def address_params
  params.require(:order).permit(:address, :post_code, :name)
  end
end
