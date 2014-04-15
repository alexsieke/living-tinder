class AddSeedToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :seed, :integer
  end
end
