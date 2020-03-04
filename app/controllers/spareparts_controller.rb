class SparepartsController < ApplicationController
    def new
        @newsparepart=Sparepart.new
    end
    def create
        @newsparepart=Sparepart.new(allowed_parameter)
        if @newsparepart.save
            redirect_to new_sparepart_path
        else
            render html:error
        end
    end
    private
    def allowed_parameter
        params.require(:sparepart).permit(:vehicle_name,:sparepart_name,:price,:quantity,:manufactured_year)
    end
end
