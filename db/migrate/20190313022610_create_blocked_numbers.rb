class CreateBlockedNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :blocked_numbers do |t|
      t.references :twilio_phone_number, foreign_key: true
      t.references :victim, foreign_key: true

      t.timestamps
    end
  end
end
