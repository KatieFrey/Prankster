class CreateVictims < ActiveRecord::Migration[5.2]
  def change
    create_table :victims do |t|
      t.string :name
      t.string :phone_number
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
