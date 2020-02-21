class SuperAdminController < ApplicationController
    def new
        @user=User.new
        @company=Company.new
    end
    def create
        @user=User.new(allowed_user_parameter)
        @user.add_role :company_admin
        if @user.save
            render html:"comany admin created"
        else
            render html:"compnay admin not created"
        end
    end
end
