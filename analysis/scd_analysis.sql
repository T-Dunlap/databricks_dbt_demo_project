select * from {{ ref('scd_source') }}
select * from {{ ref('scd_type1_and_type2') }}

select * from taylor_dunlap_catalog.dbt_tdunlap.scd_source
select * from taylor_dunlap_catalog.snapshots.scd_type1_and_type2 order by id, dbt_valid_from 