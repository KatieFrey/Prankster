class CreateUsedJokes < ActiveRecord::Migration[5.2]
  def change
    create_table :used_jokes do |t|
      t.references :all_joke, foreign_key: true
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
