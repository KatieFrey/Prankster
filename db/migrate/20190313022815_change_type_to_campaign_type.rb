class ChangeTypeToCampaignType < ActiveRecord::Migration[5.2]
  def change
    rename_column :campaigns, :type, :campaign_type
  end
end
