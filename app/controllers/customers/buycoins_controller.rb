class Customers::BuycoinsController < ApplicationController
  def new
    @buycoin = Buycoin.new
  end

  def create
    @buycoin = Buycoin.new(buycoin_params)
    @buycoin.customer_id = current_customer.id
    if @buycoin.save
      # @buycoin1 = Buycoin.find(params[@buycoin])
      redirect_to bought_path
    else
      render "new"
    end
  end

  def bought
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
