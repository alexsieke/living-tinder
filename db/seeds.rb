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