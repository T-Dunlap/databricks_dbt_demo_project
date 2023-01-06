{% macro convert_date(
    date_schema, date_column, input_format="yyyy-MM-dd", output_format="yyyy-MM-dd"
) %}
date_format(
    to_timestamp({{date_schema}}.{{ date_column }}, '{{ input_format }}')
    ,'{{ output_format }}'
) as {{ date_column }}_str,
to_timestamp({{date_schema}}.{{ date_column }}, '{{ input_format }}') as {{ date_column }}_ts
{% endmacro %}
