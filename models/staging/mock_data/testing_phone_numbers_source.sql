--Test: Validate that these phone numbers should all exist in the dim_customers table
with source_data as (
    select 2 as id, '23-768-687-3665' as phone union all
    select 3 as id, '13-750-942-6364' as phone union all
    select 4 as id, '30-114-968-4951' as phone union all
    select 5 as id, '33-464-151-3439' as phone union all
    select 6 as id, '15-741-346-9870' as phone union all
    select 7 as id, '99-999-999-9999' as phone 
)

select * from source_data 