class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :ls_category
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end
