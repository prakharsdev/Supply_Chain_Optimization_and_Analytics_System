with raw_data as (
    select
        value:shipment_id::string as shipment_id,
        value:status::string as status,
        value:location::string as location,
        value:timestamp::timestamp as timestamp
    from @your_stage/fedex/shipment_data.json
)

select
    shipment_id,
    status,
    location,
    timestamp,
    date(timestamp) as delivery_date
from raw_data
