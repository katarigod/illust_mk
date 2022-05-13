class Customers::CollectsController < ApplicationController
  def index
    @collects = Collect.where(customer_id: current_customer.id).page(params[:page]).per(8)
    # @pictures = collect.picture.page(params[:page]).per(8)
  end

  def create
    @collect =Collect.new(collect_params)
    @picture = @collect.picture
    @price = @picture.price * 10
    @collect.customer_id = current_customer.id
    if @collect.save
      @customer = current_customer
      @customer.coin -= @price
      @customer.save
      @customer2 = @picture.customer
      @customer2.coin += @price*0.9
      @customer2.save
      @admin = Admin.find(1)
      @admin.admin_coin += @price*0.1
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
