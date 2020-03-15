# frozen_string_literal: true

class ServiceCenterCapacity < ApplicationRecord
  before_create :check_count_exist
  validates :service_center_name, presence: true
  validates :count, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :column, presence: true

  private

  def check_count_exist
    if ServiceCenterCapacity.exists?(date: date)
      # flash[:notice]  = 'count already created'
      false
    end
  end
end
