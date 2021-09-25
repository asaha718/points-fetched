class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :payer, null: false
      t.integer :points, null: false
      t.datetime :timestamp, null: false

      t.timestamps
    end
    add_index :transactions, :payer
  end
end
