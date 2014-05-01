

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
join deals dd on dd.deal_id = m.deal_id
group by m.deal_id, m.category;