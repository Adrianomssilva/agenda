class AddBirthdayToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :birthday, :date
  end
end
