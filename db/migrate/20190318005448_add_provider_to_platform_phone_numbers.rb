class AddProviderToPlatformPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    add_column :platform_phone_numbers, :provider, :integer
  end
end
