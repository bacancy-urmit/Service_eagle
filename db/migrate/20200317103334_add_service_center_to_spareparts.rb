# frozen_string_literal: true

class AddServiceCenterToSpareparts < ActiveRecord::Migration[6.0]
  def change
    add_reference :spareparts, :service_center, foreign_key: true
  end
end
