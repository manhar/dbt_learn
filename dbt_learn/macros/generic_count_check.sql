{% test generic_count_check(model, column_name) %}

    select {{column_name}}, count(1) as cnt
    from {{ model }}
    group by {{column_name}}
    having count(1) > 1 

{% endtest %}