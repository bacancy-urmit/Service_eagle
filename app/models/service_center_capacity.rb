# frozen_string_literal: true

class ServiceCenterCapacity < ApplicationRecord
  def new
    @set_count = ServiceCenterCapacity.new
  end

  def create
    @set_count = ServiceCenterCapacity.new(allowed_parameters)
  end

  private
  def allowed_parameters
    params.require(:setcount).permit(:servicecount, :date)
    byebug
  end
end
