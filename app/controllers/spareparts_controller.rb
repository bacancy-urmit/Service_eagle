# frozen_string_literal: true

# sparparts controller
class SparepartsController < ApplicationController
  def new
    @newsparepart = Sparepart.new
  end

  def create
    @newsparepart = Sparepart.new(allowed_parameter)
    flash.alert = if @newsparepart.save
        'sparepart\'s entry saved!'
      else
        'sparepart\'s entry not saved!'
      end
    redirect_to new_sparepart_path
  end

  private

  def allowed_parameter
    params.require(:sparepart).permit(:vehicle_name, :sparepart_name, :price, :quantity, :manufactured_year)
  end
end
