class RenamePhoneNumberToPlatformPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    rename_table :phone_numbers, :platform_phone_numbers
  end
end
