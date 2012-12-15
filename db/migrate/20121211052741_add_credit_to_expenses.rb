class AddCreditToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :credit_account, :boolean
    add_column :expenses, :interest_rate, :decimal
    add_column :expenses, :balance, :decimal
  end
end
