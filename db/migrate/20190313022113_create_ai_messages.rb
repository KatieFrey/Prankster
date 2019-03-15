class CreateAiMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :ai_messages do |t|
      t.string :message
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
