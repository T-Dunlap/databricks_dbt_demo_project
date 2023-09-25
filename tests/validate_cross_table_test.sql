{{
    config(
        enabled=true,
        severity='warn',
        tags = ['finance']
    )
}}

with customers as ( select * from {{ ref('dim_customers') }} )

,phone_numbers as ( select * from {{ ref('testing_phone_numbers_source') }} )

select 
    customers.phone_number,
    phone_numbers.phone as missing_phone_number
from customers
right outer join phone_numbers on customers.phone_number = phone_numbers.phone
where customers.phone_number is null
