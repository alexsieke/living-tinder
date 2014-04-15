class CreateDealStats < ActiveRecord::Migration
  def change
    create_table :deal_stats do |t|
      t.references :user, index: true
      t.references :deal, index: true
      t.integer :time
      t.integer :num_tags

      t.timestamps
    end
  end
end
