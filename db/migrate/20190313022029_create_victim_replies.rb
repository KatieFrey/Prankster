class CreateVictimReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :victim_replies do |t|
      t.string :reply
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
