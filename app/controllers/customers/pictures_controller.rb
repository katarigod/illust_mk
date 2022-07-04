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
      if tag_list.empty?
        tags = Vision.get_image_data(@picture.picture_image)
        tags.each do |tag|
          if Tag.exists?(name: tag)
            aitag = Tag.find_by(name: tag)
            @picture.tagconnects.create(tag_id: aitag.id)
          else
            @picture.tags.create(name: tag)
          end
        end
      else
        @picture.save_tag(tag_list)
      end
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

  def mypictures
    @customer = Customer.find(params[:id])
    @pictures = Picture.where(customer_id: @customer.id).page(params[:page]).per(8)
  end

  def edit
    @picture = Picture.find(params[:id])
    @tag_list = @picture.tags.pluck(:name).join(',')
  end

  def update
    @picture = Picture.find(params[:id])
    tag_list = params[:picture][:name].split(',')
    if @picture.update(picture_params)
      @old_relations = Tagconnect.where(picture_id: @picture.id)
      @old_relations.each do |relation|
        relation.delete
      end
      if tag_list.empty?
        tags = Vision.get_image_data(@picture.picture_image)
        tags.each do |tag|
          if Tag.exists?(name: tag)
            aitag = Tag.find_by(name: tag)
            @picture.tagconnects.create(tag_id: aitag.id)
          else
            @picture.tags.create(name: tag)
          end
        end
      else
        @picture.save_tag(tag_list)
      end
      redirect_to mypicture_path(current_customer)
    else
      render "edit"
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:picture_image,:title,:price,:body,:is_active,:genre_id)
  end
end
