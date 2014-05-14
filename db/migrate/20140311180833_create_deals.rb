class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :deal_id
      t.integer :len
      t.text :description
      t.date :offer_starts_at
      t.date :offer_ends_at
      t.string :merchant_name
      t.string :short_title
      t.string :image_url
      t.string :city_name
      t.string :dma
      t.float :ls_pct
      t.float :feature_price
      t.float :feature_value
      t.string :sales_rep
      t.string :category
      t.string :subcategory
      t.string :concept

      t.timestamps
    end
  end
end
