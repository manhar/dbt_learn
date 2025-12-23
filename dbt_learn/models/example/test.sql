 -- depends_on: {{ ref('stg_customers') }}
 -- depends_on: {{ ref('top_level_email_domains') }}

{% set directory = 'bronze' %}

{% set models_in_directory = [] %}

{% for node in graph.nodes.values() %}
    {% if node.resource_type == 'model' and directory in node.original_file_path %}
        {% do models_in_directory.append(node.name) %}
    {% endif %}
{% endfor %}

{% set union_query = [] %}

{% for model in models_in_directory %}
    {% do union_query.append('SELECT * FROM ' ~ ref(model)) %}
{% endfor %}

{{ '\nUNION ALL\n'.join(union_query) }}
