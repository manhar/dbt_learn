select
1 as customer_id,
'Jane'  as first_name,
'Smith' as last_name,
'jane.smith@yahoo.com' as email,
'yahoo' as email_top_level_domain

union all

select
2 as customer_id,
'Alan'  as first_name,
'Parish' as last_name,
'alan.parish.yahoo.com' as email,
'yahoo' as email_top_level_domain