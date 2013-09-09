class Admin::EmployeesController < AdminController

  def index
    @page = params[:page] || 1
    params[:per_page] ||= 10
    @employees = Employee.paginate(:page => @page, :per_page => params[:per_page]).order("first_name ASC")
  end

  def new
    @employee = Employee.new
    @employee.build_user
  end

  def create
    #setting default password as 123456
    params[:employee][:user_attributes][:password] = 123456
    params[:employee][:user_attributes][:password_confirmation] = 123456

    @employee = Employee.new(params[:employee])

    if @employee.save
      flash[:info] = "New employee is created!"
      redirect_to admin_employees_path
    else
      flash[:error] = "Errors while saving record!"
      render :new
    end
  end

  def show
    @employee = Employee.find params[:id]
  end

  def edit
    @employee = Employee.find params[:id]
  end

  def update
    @employee = Employee.find params[:id]

    if @employee.update_attributes(params[:employee])
      flash[:info] = "Employee is updated!"
      redirect_to admin_employees_path
    else
      flash[:error] = "Errors while saving record!"
      render :edit
    end
  end

  def destroy
    @employee = Employee.find params[:id]
    @employee.destroy
    flash[:info] = "Employee record is deleted!"
    redirect_to admin_employees_path
  end
end
