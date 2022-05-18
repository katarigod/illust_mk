class Admins::BuycoinsController < ApplicationController
  def index
    @buycoins = Buycoin.all.page(params[:page]).per(20)
  end

  def show
    @buycoin = Buycoin.find(params[:id])
  end

  def update
    @buycoin = Buycoin.find(params[:id])
    if @buycoin.update(buycoin_params)
      if @buycoin.yet_buy == false
        customer = @buycoin.customer
        customer.coin += @buycoin.piece
        customer.save
      else
      end
      redirect_to admins_buycoins_path
    else
      render "show"
    end
  end

  private

  def buycoin_params
    params.require(:buycoin).permit(:piece,:yet_buy)
  end
end