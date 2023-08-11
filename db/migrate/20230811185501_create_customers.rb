class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cell
      t.string :e_mail
      t.integer :day_anniversary
      t.string :month_anniversary
      t.integer :year_anniversary

      t.timestamps
    end
  end
end
