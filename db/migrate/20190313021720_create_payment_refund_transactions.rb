class CreatePaymentRefundTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_refund_transactions do |t|
      t.integer :amount
      t.string :stripe_refund_id
      t.references :payment_transaction, foreign_key: true

      t.timestamps
    end
  end
end
