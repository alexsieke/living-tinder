LivingTinder
------------

LivingTinder is an application to faciliate mechanical turking.

##About
Users are presented with a login screen

They sign up with their name, birthday and gender.  They are then given the opportunity to tag 25 deals.

At the conclusion of their tagging they are presented with a confirmation code they can paste back into mechanical turk.

Set up your mechanical turk for external survey and then give turkers the link to your rails environment (I set mine up on Heroku)

##Set up

Clone the github repo and run bundle install

	git clone https://github.com/alexsieke/living-tinder.git
	bundle
	
Run the migrations to generate the data model

	rake db:migrate
	
Set up the environment variables

	living-tinder/lib/tasks/getdeals.rake
	
you will need to change line 9 to use your basic auth credentials

Right now I have the password set as an environment variable and the username hard coded in.  Change it to your user name and then change your password:

	:http_basic_authentication=>["alexander.sieke", ENV['PASSWORD']]
	
Lets seed the db, first edit the seed file

	living-tinder/db/seeds.db
	
edit the above file with your categories, then run the seed commmand

	rake db:seed

Run the rake command to import the deals _if you have already run seed you don't need to do this_

	rake deals:build
	
This will import all deals from the following watson table

	watson_future_deals

Do not change the data fields in this table or it will break the rails script.  You can however change the where statement to select a different

Upload it to somewhere, maybe heroku, thats what worked for me.  This is a good tutorial though I suspect you know how to do this if you are reading this doc.. [link](https://devcenter.heroku.com/articles/getting-started-with-rails4)

##Next Steps

After you get the app live and working, users will be able to tag anything deal in the deals data model with any tags in the tags data model.  There is a bridge table **deal_tags** that connects deals and tags

##Analysis

Running the following query in your db (this is postgres) will yield results about which tags were selected for which deal:

	select
	m.deal_id,
	max(dd.offer_starts_at) as offer_starts_at,
	max(dd.short_title) as short_title,
	max(dd.merchant_name) as merchant_name,
	m.category as tag_category,
	array_agg(m.name || ' - ' || m.num_tags::text) as tags
	from
	(
		select
		d.deal_id,
		t.category,
		t.name,
		count(1) as num_tags
		from deal_tags dt
		join deals d on d.id = dt.deal_id
		join users u on u.id = dt.user_id
		join tags t on t.id = dt.tag_id
		group by d.deal_id, t.category, t.name
		order by deal_id, category, name
	) m

