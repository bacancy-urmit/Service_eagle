class CompaniesController < ApplicationController
    def new
        @company=Company.new
    end
    def create
        @company=Company.new(company_parameter)
    end
    protected
    def company_parameter
        params.require(:company).permit(:name, :website ,:email)
    end
end
