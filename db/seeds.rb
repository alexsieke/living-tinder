require 'open-uri'

Deal.delete_all
Dma.delete_all
DealTag.delete_all
DealStat.delete_all
User.delete_all
Tag.delete_all


puts "=============================="
puts "Getting Deals"
puts "=============================="
i = 0
open("http://rainman.livingsocial.com/data/future_deals.txt", :http_basic_authentication=>["alexander.sieke", ENV['PASSWORD']]) do |all_text|
  all_text.read.each_line do |line|
    a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14 = line.chomp.split("\t")
    if i == 0
    	i = i + 1
    	next
    end
    begin
    	Dma.create(
    		name: a10
    	)
	    Deal.create(
	      deal_id: a1.to_i,
	      len: a2.to_i,
	      description: a3,
	      offer_starts_at: a4,
	      offer_ends_at: a5,
	      merchant_name: a6,
	      short_title: a7,
	      image_url: a8,
	      city_name: a9,
	      dma: a10,
	      ls_pct: a11,
	      feature_price: a12,
	      feature_value: a13,
	      sales_rep: a14
	    )
	   rescue
	   end
    puts i
    i = i + 1
  end
end
puts "=============================="
puts "Getting Tags"
puts "=============================="
Tag.create(:category => "Ambiance", :name => "Fancy")
Tag.create(:category => "Ambiance", :name => "Casual")
Tag.create(:category => "Ambiance", :name => "Romantic")
Tag.create(:category => "Ambiance", :name => "Loud")
Tag.create(:category => "Ambiance", :name => "Girls Night")
Tag.create(:category => "Ambiance", :name => "Laid Back")
Tag.create(:category => "Ambiance", :name => "Dressy")
Tag.create(:category => "Ambiance", :name => "Date Night")

Tag.create(:category => "Destination", :name => "Walkable / Downtown")
Tag.create(:category => "Destination", :name => "Cool Neighborhood")
Tag.create(:category => "Destination", :name => "Suburban")
Tag.create(:category => "Destination", :name => "Public Transit")
Tag.create(:category => "Destination", :name => "Franchise")
Tag.create(:category => "Destination", :name => "Independent")
Tag.create(:category => "Destination", :name => "Shopping Center")

Tag.create(:category => "Outings", :name => "Family")
Tag.create(:category => "Outings", :name => "Just the Guys")
Tag.create(:category => "Outings", :name => "Just the Girls")
Tag.create(:category => "Outings", :name => "Big Parties")
Tag.create(:category => "Outings", :name => "Quiet")
Tag.create(:category => "Outings", :name => "Birthdays")
Tag.create(:category => "Outings", :name => "Corporate")
Tag.create(:category => "Outings", :name => "Daytime")
Tag.create(:category => "Outings", :name => "Nighttime")

Tag.create(:category => "Gift Ideas", :name => "For Mom")
Tag.create(:category => "Gift Ideas", :name => "For Dad")
Tag.create(:category => "Gift Ideas", :name => "For Him")
Tag.create(:category => "Gift Ideas", :name => "For Her")
Tag.create(:category => "Gift Ideas", :name => "For Kids")
Tag.create(:category => "Gift Ideas", :name => "Anniversary")
Tag.create(:category => "Gift Ideas", :name => "Birthday")
Tag.create(:category => "Gift Ideas", :name => "Housewarming")
Tag.create(:category => "Gift Ideas", :name => "Personalized")




