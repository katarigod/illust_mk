class Admins::BuycoinsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @revenue = current_admin.admin_coin
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
