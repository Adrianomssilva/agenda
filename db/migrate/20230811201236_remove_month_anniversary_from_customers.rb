class RemoveMonthAnniversaryFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :month_anniversary, :string
  end
end
