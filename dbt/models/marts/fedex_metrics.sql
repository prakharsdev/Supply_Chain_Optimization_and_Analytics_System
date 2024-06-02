select 
    shipment_id,
    status,
    location,
    delivery_date,
    count(*) over (partition by delivery_date) as daily_shipments
from {{ ref('stg_fedex_data') }}
