class AddDefaultCreditsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :credits, :integer, default: 0
  end
end
