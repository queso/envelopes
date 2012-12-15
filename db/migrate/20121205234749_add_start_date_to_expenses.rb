class AddStartDateToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :start_date, :date
  end
end
