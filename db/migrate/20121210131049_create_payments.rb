class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :expense, index: true
      t.date :pay_date
      t.decimal :amount

      t.timestamps
    end
  end
end
