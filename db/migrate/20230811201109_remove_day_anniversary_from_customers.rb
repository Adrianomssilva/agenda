class RemoveDayAnniversaryFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :day_anniversary, :integer
  end
end
