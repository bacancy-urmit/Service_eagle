# frozen_string_literal: true

# company crud operations
class CompaniesController < ApplicationController
  def new
    @company = Company.new
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
    @companies = Company.all
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(paramsa[:id])
    @company.update(name: params[:company][:name], website: params[:company][:website], email: params[:company][:email])
    flash.alert = 'updated successfully'
    redirect_to company_path(:id)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash.alert = 'deleted successfully'
    redirect_to company_path(:id)
  end

    private

  def company_parameter
    params.require(:company).permit(:name, :website, :email)
  end

  def find_company
    params.require(:company).permit(:email)
  end
  end
  