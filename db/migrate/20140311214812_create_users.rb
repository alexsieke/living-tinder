class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :birthyear
      t.string :gender

      t.timestamps
    end
  end
end
