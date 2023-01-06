{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {% do return(adapter.dispatch('generate_alias_name', 'dbt')(custom_alias_name, node)) %}
{%- endmacro %}

{% macro default__generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if target.name == 'CI' -%}


        {%- if custom_alias_name is none -%}

            {{ target.schema }}_{{ node.name }}

        {%- else -%}

            {{ target.schema }}_{{ custom_alias_name | trim }}

        {%- endif -%}

    {%- else  -%}

        {%- if custom_alias_name is none -%}

            {{ node.name }}

        {%- else -%}

            {{ custom_alias_name | trim }}

        {%- endif -%}

    {%- endif -%}





{%- endmacro %}