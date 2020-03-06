# frozen_string_literal: true

class ServiceCenterCapacity < ApplicationRecord
  before_create :check_count_exist

  private

  def check_count_exist
    if ServiceCenterCapacity.exists?(date: self.date)
      # flash[:notice]  = 'count already created'
      return false
    end
  end
end
