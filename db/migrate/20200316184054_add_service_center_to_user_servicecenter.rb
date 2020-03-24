# frozen_string_literal: true

class AddServiceCenterToUserServicecenter < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_servicecenters, :service_center, foreign_key: true
  end
end
