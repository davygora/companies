class Api::V1::EmployeesController < ApplicationController
  before_filter :restrict_access
  respond_to :json

  #GET /employees
  def index
    respond_with Employee.all
  end

  #GET /employees/1
  def show
    respond_with Employee.find(params[:id])
  end

  #POST /employees
  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: 201
    else
      render json: { errors: employee.errors }, status: 422
    end
  end

  #PATCH/PUT /employees/1
  def update
    employee = Employee.find(params[:id])
    if employee.update(employee_params)
      render json: employee, status: 200
    else
      render json: { errors: employee.errors }, status: 422
    end
  end

  #DELETE /employees/1
  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    head 204
  end

private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :title, :birthday, :email, :phone, :company_id)
  end

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end