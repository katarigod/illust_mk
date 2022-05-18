class Admins::RevenuesController < ApplicationController
  def index
    @revenue = current_admin.admin_coin
  end
end
