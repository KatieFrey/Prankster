class AddDoneToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :done, :boolean, default: false
  end
end
