-- macros/truncate_and_reload_materialization.sql

{% materialization truncate_and_reload, adapter='default' %}
  {%- set identifier = model['alias'] -%}


  -- truncate and reload
    begin;

    truncate table {{ target }};

    insert into {{ target }}
    {{ sql }};

    commit;
  
{% endmaterialization %}