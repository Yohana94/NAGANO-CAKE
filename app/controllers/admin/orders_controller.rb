class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def show
    @order= Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
     if @order.order_status == "payment_confirmation"
       @order.order_details.each do |order_detail|
       order_detail.update(making_status: 1)
       end
     end
    redirect_to admin_order_path(@order.id)
    else
      render :edit
    end
  end

  private
  def order_params
     params.require(:order).permit(:name, :updated_at, :address, :method_of_payment, :order_status)
  end

end
