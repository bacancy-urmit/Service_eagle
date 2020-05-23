# frozen_string_literal: true

class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
    add_column :users, :contact, :string
  end
end
