# frozen_string_literal: true

class CreateUsedSpareparts < ActiveRecord::Migration[6.0]
  def change
    create_table :used_spareparts, &:timestamps
  end
end
