class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.integer :number_of_jokes
      t.integer :duration
      t.integer :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
