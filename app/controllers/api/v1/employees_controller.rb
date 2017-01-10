class Api::V1::EmployeesController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  #DRY with param_group
  def_param_group :employee do
    param :employee, Hash, desc: 'Employee inforamation' do
      param :first_name, String, desc: 'Name of employee'
      param :last_name, String, desc: 'last name of employee'
      param :title, String, desc: 'Title of employee'
      param :birthday, String, desc: 'Birthday of employee'
      param :email, String, desc: 'Email of employee'
      param :phone, String, desc: 'Phone of employee'
    end
  end

  api :GET, '/companies/:company_id/employees', 'list of all employees of company'
  error code: 401, desc: "Unauthorized"
  error code: 404, desc: "Not found"
  param :employees, Array, of: Hash, desc: 'Array of hash of all employees' do
    param :first_name, String, desc: 'Name of employee'
    param :last_name, String, desc: 'last name of employee'
    param :title, String, desc: 'Title of employee'
    param :birthday, String, desc: 'Birthday of employee'
    param :email, String, desc: 'Email of employee'
    param :phone, String, desc: 'Phone of employee'
    param :company_id, Integer, desc: 'Company id of employee'
    param :company, Hash, desc: 'Information of company'
  end

  #GET /employees
  def index
    respond_with Employee.all, adapter: :json
  end

  api :GET, '/companies/:company_id/employees/:id', 'Show employee by id'
  error code: 401, desc: "Unauthorized"
  error code: 404, desc: "Not found"
  param :employee, Hash, desc: 'Employee inforamation' do
    param :first_name, String, desc: 'Name of employee'
    param :last_name, String, desc: 'last name of employee'
    param :title, String, desc: 'Title of employee'
    param :birthday, String, desc: 'Birthday of employee'
    param :email, String, desc: 'Email of employee'
    param :phone, String, desc: 'Phone of employee'
    param :company_id, Integer, desc: 'Company id of employee'
    param :company, Hash, desc: 'Information of company'
  end

  #GET /employees/1
  def show
    respond_with Employee.find(params[:id]), adapter: :json
  end

  api :POST, '/companies/:company_id/employees', 'Create employee for company'
  error code: 401, desc: "Unauthorized"
  error code: 422, desc: "Invalid params"
  param_group :employee

  #POST /employees
  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: 201
    else
      render json: { errors: employee.errors }, status: 422
    end
  end

  api :PUT, '/companies/:company_id/employees/:id', 'Update employee of company'
  error :code => 401, :desc => "Unauthorized"
  error :code => 422, :desc => "Invalid params"
  error :code => 404, :desc => "Not found"
  param_group :employee

  #PUT /employees/1
  def update
    employee = Employee.find(params[:id])
    if employee.update(employee_params)
      render json: employee, status: 200
    else
      render json: { errors: employee.errors }, status: 422
    end
  end

  api :DELETE, '/companies/:company_id/employees/:id', 'Delete employee of the company'
  error :code => 401, :desc => "Unauthorized"
  error :code => 404, :desc => "Not found"

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
