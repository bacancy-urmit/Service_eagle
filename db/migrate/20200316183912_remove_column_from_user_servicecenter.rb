# frozen_string_literal: true

class RemoveColumnFromUserServicecenter < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_servicecenters, :service_center_id
  end
end
