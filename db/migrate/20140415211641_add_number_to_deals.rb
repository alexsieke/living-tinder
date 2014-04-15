class AddNumberToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :number_tags, :integer
  end
end
