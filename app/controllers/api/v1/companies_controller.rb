class Api::V1::CompaniesController < ApplicationController
  respond_to :json

  #GET /companies
  def index
    respond_with Company.all
  end

  #GET /companies/1
  def show
    respond_with Company.find(params[:id])
  end

  #POST /companies
  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: 201
    else
      render json: { errors: company.errors }, status: 422
    end
  end

  #PUT/PATCH /companies/1
  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      render json: company, status: 200
    else
      render json: { errors: company.errors }, status: 422
    end
  end

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
end