class Customers::PicturesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @pictures = Picture.where(is_active: true).page(params[:page]).per(8)
    @tag_list=Tag.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.customer_id = current_customer.id
    tag_list = params[:picture][:name].split(',')

    if @picture.save
      @picture.save_tag(tag_list)
      redirect_to mypage_path(current_customer)
    else
      render "new"
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @collect =Collect.new
    @price = @picture.price * 10
    # @tags = @picture.tags.pluck(:name).join(',')
  end

  def mypictures
    @pictures = Picture.where(customer_id: current_customer.id).page(params[:page]).per(8)
  end

  def edit
    @picture = Picture.find(params[:id])
    @tags = @picture.tags.pluck(:name).join(',')
  end

  def update
    @picture = Picture.find(params[:id])
    # tags = params[:picture][:tag_id].split(',')
    if @picture.update(picture_params)
      # @picture.update_tags(tags)
      redirect_to mypicture_path
    else
      render "edit"
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:picture_image,:title,:price,:body,:is_active,:genre_id)
  end
end
