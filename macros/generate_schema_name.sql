{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {% if not custom_schema_name and node.resource_type == 'model' %}
        {{ exceptions.raise_compiler_error(
            'Model must have a custom schema configured.'
        )}}
    {% endif%}

    {% set default_ci_schema =  'ci_schema' %}

    {%- if target.name.lower() == 'dev' -%}

        {{ default_schema }}

    {%- elif target.name.lower() == 'ci' -%}

        {{ default_ci_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}