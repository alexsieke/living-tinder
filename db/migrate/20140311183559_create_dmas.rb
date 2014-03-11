class CreateDmas < ActiveRecord::Migration
  def change
    create_table :dmas do |t|
      t.string :name

      t.timestamps
    end
  end
end
