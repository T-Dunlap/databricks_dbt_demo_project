{% macro generate_schema_name(custom_schema_name=none, node=none) -%}
    {%- set default_schema = target.schema -%}
    
    {%- if target.name == 'dev' -%}

        {{ default_schema }}
        
    {%- elif target.name == 'ci' -%}

        dbt_tdunlap_cijob
        
    {%- elif custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}    
{%- endmacro %}