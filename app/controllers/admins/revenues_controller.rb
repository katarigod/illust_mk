class Admins::RevenuesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @revenue = current_admin.admin_coin
  end
end
