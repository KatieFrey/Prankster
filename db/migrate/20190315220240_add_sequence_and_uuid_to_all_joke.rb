class AddSequenceAndUuidToAllJoke < ActiveRecord::Migration[5.2]
  def change
    add_column :all_jokes, :sequence, :integer
    add_column :all_jokes, :uuid, :integer
  end
end
