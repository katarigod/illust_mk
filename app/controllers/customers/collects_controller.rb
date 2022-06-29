class Customers::CollectsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @collects = Collect.where(customer_id: current_customer.id).page(params[:page]).per(8)
    @customer = current_customer
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

  def set


    collect = Collect.find(params[:id])
    customer = current_customer
    customer.profile_url = url_for(collect.picture.picture_image)
    customer.profile_id = collect.picture.customer_id

    if customer.save
      redirect_to mypage_path(current_customer.id)
    else
      render 'index'
    end
  end

  private
  def collect_params
    params.require(:collect).permit(:customer_id, :picture_id)
  end
end
