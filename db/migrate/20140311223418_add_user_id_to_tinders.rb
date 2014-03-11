class AddUserIdToTinders < ActiveRecord::Migration
  def change
    add_column :tinders, :user_id, :integer
  end
end
