class Admins::PicturesController < ApplicationController
  def index
    @revenue = current_admin.admin_coin
    @pictures = Picture.all.page(params[:page]).per(8)
    @tag_list=Tag.all
  end

  def show
    @picture = Picture.find(params[:id])
    @collect =Collect.new
    @price = @picture.price * 10
  end

  def create
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to admins_pictures_path
  end

end
