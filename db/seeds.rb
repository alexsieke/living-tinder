require 'open-uri'

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

Tag.delete_all
Tag.create(:category => "Features", :name => "Reservations")
Tag.create(:category => "Features", :name => "Take-out")
Tag.create(:category => "Features", :name => "Delivery")
Tag.create(:category => "Features", :name => "Parking")
Tag.create(:category => "Features", :name => "Groups")
Tag.create(:category => "Features", :name => "Free WiFi")
Tag.create(:category => "Features", :name => "Dressy")
Tag.create(:category => "Features", :name => "Alcohol")
Tag.create(:category => "Features", :name => "Has TVs")
Tag.create(:category => "Cuisine", :name => "Asian")
Tag.create(:category => "Cuisine", :name => "American")
Tag.create(:category => "Cuisine", :name => "Fusion")
Tag.create(:category => "Cuisine", :name => "Thai")
Tag.create(:category => "Cuisine", :name => "Indian")
Tag.create(:category => "Cuisine", :name => "Kabob")
Tag.create(:category => "Cuisine", :name => "Chinese")
Tag.create(:category => "Cuisine", :name => "Tex-Mex")
Tag.create(:category => "Cuisine", :name => "Brazilian")
Tag.create(:category => "Event", :name => "Date Night")
Tag.create(:category => "Event", :name => "Kid Friendly")
Tag.create(:category => "Event", :name => "Romantic")
Tag.create(:category => "Event", :name => "Casual")
Tag.create(:category => "Event", :name => "Elite Pregame")
Tag.create(:category => "Event", :name => "Good for Bros")

