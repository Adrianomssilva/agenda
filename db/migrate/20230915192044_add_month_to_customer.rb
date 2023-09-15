class AddMonthToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :month, :integer
  end
end
