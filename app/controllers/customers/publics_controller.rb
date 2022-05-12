class Customers::PublicsController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
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
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:email,:coin)
  end
end
