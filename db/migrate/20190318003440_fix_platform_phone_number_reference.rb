class FixPlatformPhoneNumberReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :blocked_numbers, :twilio_phone_number_id

    add_reference :blocked_numbers, :platform_phone_number, index: true
  end
end
