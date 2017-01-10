class Api::V1::CompaniesController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  #DRY with param_group
  def_param_group :company do
    param :companies, Hash, desc: 'Company information' do
      param :name, String, desc: 'Name of company'
      param :location, String, desc: 'Location of company'
      param :employees, Array, of: Hash, desc: 'Array of employees'
  end
end

  api :GET, '/companies', 'Index view for all companies'
  error code: 401, desc: "Unauthorized"
  param :companies, Hash, desc: 'Has of all companies' do
    param :name, String, desc: 'Name of company'
    param :location, String, desc: 'Location of company'
    param :employees, Array, of: Hash, desc: 'Array of employees'
  end

  #GET /companies
  def index
    respond_with Company.all, adapter: :json
  end

  api :GET, '/companies/:id', 'Show company by id'
  error code: 404, desc: "Not found"
  error code: 401, desc: "Unauthorized"
  param :company, Hash, desc: 'Company information' do
    param :name, String, desc: 'Name of company'
    param :location, String, desc: 'Location of company'
    param :employees, Array, of: Hash, desc: 'Array of employees'
  end

  #GET /companies/1
  def show
    respond_with Company.find(params[:id]), adapter: :json
  end

  api :POST, '/companies', 'Create a new company'
  error code: 401, desc: "Unauthorized"
  error code: 422, desc: "Invalid params"
  param_group :company

  #POST /companies
  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: 201
    else
      render json: { errors: company.errors }, status: 422
    end
  end

  api :PUT, '/companies/:id', 'Update a company by id'
  error code: 401, desc: "Unauthorized"
  error code: 422, desc: "Invalid params"
  error code: 404, desc: "Not found"
  param_group :company

  #PUT /companies/1
  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      render json: company, status: 200
    else
      render json: { errors: company.errors }, status: 422
    end
  end

  api :DELETE, '/companies/:id', 'Destroy a company'
  error code: 401, desc: "Unauthorized"
  error code: 404, desc: "Not found"

  #DELETE /companies/1
  def destroy
    company = Company.find(params[:id])
    company.destroy
    head 204
  end

private

  def company_params
    params.require(:company).permit(:name, :location)
  end

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end
