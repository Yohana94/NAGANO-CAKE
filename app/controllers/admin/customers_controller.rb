class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_new = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  def customer_params
    params.require(:customer).permit(:is_active, :last_name, :first_name, :last_name_kana, :first_name_kana,:email, :postal_code, :address, :telephone_number)
  end
end
