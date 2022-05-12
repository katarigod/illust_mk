class Customers::CollectsController < ApplicationController
  def index
    @customer = current_customer
    mycollect = current_customer.collect
    @pictures = mycollect.picture.page(params[:page]).per(8)
  end

  def create
    @collect =Collect.new(collect_params)
    @collect.customer_id = current_customer.id
    if @collect.save
      @customer = current_customer
      @customer.coin = @customer.coin - @price
      @customer.save
      @customer2 = @picture.customer
      @customer2.coin = @customer2.coin + @price*0.9
      @customer2.save
      @admin = Admin.find(params[1])
      @admin.admin_coin = @admin.admin_coin + @price*0.1
      @admin.save
      redirect_to collects_path
    else
      redirect_to request.referer
    end
  end

  private
  def collect_params
    params.require(:collect).permit(:customer_id, :picture_id)
  end
end
