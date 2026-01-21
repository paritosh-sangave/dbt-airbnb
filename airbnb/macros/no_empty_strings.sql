{% macro no_empty_strings(model) %}
    {%- for col in adapter.get_columns_in_relation(model) if col.is_string() %}
        {{ col.name }} IS NOT NULL AND {{ col.name }} <> ''
        {% if not loop.last -%}
            AND
        {%- endif -%}
    {%- endfor %}
{%- endmacro -%}