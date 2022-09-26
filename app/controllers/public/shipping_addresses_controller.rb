class Public::ShippingAddressesController < ApplicationController
   before_action :authenticate_customer!
  def update
     @address= current_customer.addresses.find(params[:id])
    if @address.update(address_params)
    redirect_to shipping_addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to shipping_addresses_path
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to shipping_addresses_path
  end

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def edit
     @address = Address.find(params[:id])
  end

   private
  def address_params
  params.require(:address).permit(:postal_code, :address, :name)
  end
end
