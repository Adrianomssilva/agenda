class RemoveMonthFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :month, :integer
  end
end
