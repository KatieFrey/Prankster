class RenameTwilioPhoneNumberToPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    rename_table :twilio_phone_numbers, :phone_numbers
  end
end
