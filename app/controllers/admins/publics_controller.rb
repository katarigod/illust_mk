class Admins::PublicsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @revenue = current_admin.admin_coin
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def destroy
    @customer=Customer.find(params[:id])
    @customer.destroy
    redirect_to admins_publics_path
  end
end
