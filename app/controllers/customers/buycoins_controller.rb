class Customers::BuycoinsController < ApplicationController
  def new
    @buycoin = Buycoin.new
  end

  def create
    @buycoin = Buycoin.new(buycoin_params)
    @buycoin.customer_id = current_customer.id
    if @buycoin.save
      redirect_to mypage_path(current_customer)
    else
      render "new"
    end
  end

  def index
  end

  def show
  end

  private

  def buycoin_params
    params.require(:buycoin).permit(:piece,:customer_id)
  end
end
