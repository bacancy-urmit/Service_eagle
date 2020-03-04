# frozen_string_literal: true

# company crud operations
class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_parameter)
    if @company.save
      flash.alert = 'company created successfully'
      redirect_to company_path(:id)
    else
      flash.alert = 'company created successfully'
      redirect_to company_path(:id)
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_parameter)
    flash.alert = 'updated successfully'
    redirect_to companies_path
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash.alert = 'deleted successfully'
    redirect_to companies_path
  end

  private

  def company_parameter
    params.require(:company).permit(:name, :website, :email)
  end

  def find_company
    params.require(:company).permit(:email)
  end
end
