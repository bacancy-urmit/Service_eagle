class AddCompanyToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :User, :company, foreign_key: true
  end
end
