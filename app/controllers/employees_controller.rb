class EmployeesController < ApplicationController

  def index 
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        @employee.valid?
        format.html { render 'employees/new.html.slim' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email)
    end
end
