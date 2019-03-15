class CreatePaymentInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_infos do |t|
      t.string :stripe_token
      t.string :last_four_digits
      t.string :card_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
