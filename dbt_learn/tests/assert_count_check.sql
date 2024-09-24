select id, count(1) as cnt
from {{ ref ("my_first_dbt_model")  }}
group by id 
having count(1) >1 