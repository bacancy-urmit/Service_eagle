# frozen_string_literal: true

# sparparts controller
class SparepartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_service_center_of_current_user, :display_all_spareparts, only: [:index]
  def new
    @servicecenter_name = current_user.user_servicecenter.service_center.name
    @newsparepart = Sparepart.new
  end

  def create
    @new_sparepart = Sparepart.new(allowed_parameter) 
    service_center_id = current_user.user_servicecenter.service_center.id
    @new_sparepart.service_center_id = service_center_id
    flash.alert = if @new_sparepart.save
                    'sparepart\'s entry saved!'
                  else
                    'sparepart\'s entry not saved!'
                  end
    redirect_to new_sparepart_path
  end

  private

  def find_service_center_of_current_user
    @service_center = current_user.user_servicecenter.service_center
  end

  def display_all_spareparts
    @spareparts = @service_center.spareparts
  end

  def allowed_parameter
    params.require(:sparepart).permit(:vehicle_name, :sparepart_name, :price, :quantity, :manufactured_year)
  end
end
