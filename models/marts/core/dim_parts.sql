{{
    config(
        materialized='incremental',
        incremental_strategy='append',
        pre_hook='truncate table {{this}}'
    )
}}


with part as (

    select * from {{ref('stg_tpch_parts')}}

),

final as (
    select 
        part_key,
        manufacturer as manufact,
        name,
        brand,
        type,
        size,
        container,
        retail_price
    from
        part
)
select *
from final  
order by part_key