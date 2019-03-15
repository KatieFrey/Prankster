class CreateAllJokes < ActiveRecord::Migration[5.2]
  def change
    create_table :all_jokes do |t|
      t.string :joke
      t.integer :joke_type

      t.timestamps
    end
  end
end
