class CompaniesController < ApplicationController
    
    def new
        @company=Company.new
    end
    def create

        @company=Company.new(company_parameter)
        if @company.save
            render :new
        else
            render :companyregistration
        end
    end
    def edit
        @company=Company.find_by(find_company)
        render :edit_company
    end
    private
    def company_parameter
        params.require(:company).permit(:name, :website, :email)
    end
    def find_company
        params.require(:company).permit(:email)
    end
end
