class AdminController < ApplicationController

  before_filter :authenticate_user!
  before_filter :admin_user!

  def index

  end

  private

  def admin_user!
    unless current_user.admin_user
      flash[:notice] = "Access Denied, You are not Admin User!"
      redirect_to root_path
    end
  end
end
