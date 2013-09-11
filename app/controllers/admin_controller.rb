class AdminController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin!

  def index

  end

  private

  def authenticate_admin!
    unless current_user.admin_user
      flash[:notice] = "Access Denied, You are not Admin User!"
      redirect_to root_path
    end
  end
end
