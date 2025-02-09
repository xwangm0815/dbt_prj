select
	id,
	orderid, 
	paymentmethod,
	status,
	amount 

from {{ source('gp_tran', 'payment') }}