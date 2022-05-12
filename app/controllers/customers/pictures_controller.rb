class Customers::PicturesController < ApplicationController
  def index
    @pictures = Picture.where(is_active: true).page(params[:page]).per(8)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.customer_id = current_customer.id

    if @picture.save
      redirect_to mypage_path(current_customer)
    else
      render "new"
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @collect =Collect.new
    @price = @picture.price * 10
  end

  def edit
  end

  private

  def picture_params
    params.require(:picture).permit(:picture_image,:title,:price,:body,:is_active,:genre_id)
  end
end
