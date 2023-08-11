class RemoveYearAnniversaryFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :year_anniversary, :integer
  end
end
