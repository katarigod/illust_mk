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

  def change
    @change = ChangeCoin.new
  end

  def confirm
    @change = ChangeCoin.new(change_coin_params)
    piece1 = @change.piece * 1000
    if piece1 <= current_customer.coin
      @gabas = @change.piece * 900
    else
      redirect_to '/buycoins/change'
    end

  end

  def changecoin
    @change = ChangeCoin.new(change_coin_params)
    @change.customer_id = current_customer.id
    if @change.save
      current_customer.coin -= @change.piece * 1000
      current_customer.save
      admin = Admin.find(1)
      admin.admin_coin += @change.piece * 100
      admin.save
      redirect_to mypage_path(current_customer.id)
    else
      render 'change'
    end
  end

  def update
    @change = ChangeCoin.new(change_coin_params)
  end

  def index
  end

  def show
  end

  private

  def buycoin_params
    params.require(:buycoin).permit(:piece,:customer_id)
  end

  def change_coin_params
    params.permit(:piece,:customer_id)
  end
end
