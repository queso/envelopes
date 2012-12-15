class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.decimal :amount
      t.integer :day_of_month
      t.boolean :recurring
      t.integer :every_x_weeks
      t.date :start_date

      t.timestamps
    end
  end
end
