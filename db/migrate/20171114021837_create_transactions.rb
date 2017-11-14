class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :borrower
      t.references :post
      t.string :duration
      t.integer :final_price

      t.timestamps
    end
  end
end
