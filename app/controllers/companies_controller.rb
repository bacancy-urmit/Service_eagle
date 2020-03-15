# frozen_string_literal: true

# company crud operations
class CompaniesController < ApplicationController
  before_action :authenticate_user!
  def new
    @company = Company.new
  end

  def index
    @companies = Company.all
  end

  def create
    @company = Company.new(company_parameter)
    flash.alert = if @company.save
                    'company created successfully'
                  else
                    'company created successfully'
      end
    redirect_to company_path(@company)
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

  def allowed_parameter
    params.require(:company).permit(:name, :website, :email)
  end
end
