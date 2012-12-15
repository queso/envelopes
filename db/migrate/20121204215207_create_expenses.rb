class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.integer :day_of_month
      t.boolean :recurring
      t.string :name

      t.timestamps
    end
  end
end
