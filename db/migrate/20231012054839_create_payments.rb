class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payment do |t|
      t.integer :amount
      t.string :transaction_id
      t.string :status
      t.datetime :timestamp
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
