class CreateTinders < ActiveRecord::Migration
  def change
    create_table :tinders do |t|
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps
    end
  end
end
