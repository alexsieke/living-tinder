class CreateDealTags < ActiveRecord::Migration
  def change
    create_table :deal_tags do |t|
      t.references :deal, index: true
      t.references :tag, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
