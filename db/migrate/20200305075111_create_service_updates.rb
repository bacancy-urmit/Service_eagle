# frozen_string_literal: true

class CreateServiceUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :service_updates, &:timestamps
  end
end
