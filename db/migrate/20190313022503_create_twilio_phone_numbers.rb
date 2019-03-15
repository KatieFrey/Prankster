class CreateTwilioPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :twilio_phone_numbers do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
