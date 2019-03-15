class CreatePaymentTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_transactions do |t|
      t.integer :amount
      t.string :stripe_transaction_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
