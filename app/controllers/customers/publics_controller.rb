class Customers::PublicsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    # @collect = Collect.find(params[:format])
    # binding.pry
    if @customer == current_customer
      if @customer.coin == nil
        @customer.coin = 0
        @customer.save
        @customer = Customer.find(params[:id])
        render 'show'
      end
    end

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to mypage_path(current_customer.id)
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:email,:coin)
  end
end
