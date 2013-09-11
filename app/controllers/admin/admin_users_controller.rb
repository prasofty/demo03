class Admin::AdminUsersController < AdminController

  def index
    @admin_user = AdminUser.new
    @admin_users = AdminUser.includes(:user)
  end

  def create
    @user = User.find_by_email params[:email]
    if @user
      @user.build_admin_user
      @user.save
      flash[:notice] = "#{@user.email} is successfully added as admin."
    else
      flash[:error] = "Error while adding as admin. Please enter valid email."
    end
    redirect_to admin_admin_users_path
  end

  def destroy
    admin_user = AdminUser.find params[:id]
    if admin_user == current_user.admin_user
      flash[:error] = "You can't delete yourself form admin users"
    elsif AdminUser.count < 2
      flash[:error] = "Their should be One Admin User"
    else
      admin_user.destroy
      flash[:success] = "Admin User deleted successfully"
    end

    redirect_to admin_admin_users_path
  end
end
