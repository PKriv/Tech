with aaa as
(
select trf.id, trf.name
    , JSON_VALUE (trf_cond.attributes, '$.attributes.IntOpIdCredit') IntOpIdCredit
    , trf_tx_type.TXN_TYPE_ID
from TRF_TARIFF trf, TRF_TARIFF_CONDITION trf_cond, TRF_TARIFF_COND__TXN_TYPE trf_tx_type
    where trf.AUDIT_STATE = 'A'
        and trf.id = trf_cond.TARIFF_ID
        and trf_tx_type.TARIFF_CONDITION_ID = trf_cond.id
        and trf_tx_type.TXN_TYPE_ID = 8
        and trf.TARIFF_GROUP_ID = 100000
--        and trf.id = 100069
)

select distinct
    trf_bvr.id, trf_bvr.name, aaa.IntOpIdCredit "IntOpIdCredit"
    , trf_val.base_amount_type, trf_val.base_value, trf_val.PERCENT_VALUE
    , aaa.TXN_TYPE_ID
from aaa, TRF_TARIFF trf_bvr, TRF_TARIFF_VALUE trf_val 
    where aaa.id = trf_bvr.template_id
        and trf_val.tariff_id = trf_bvr.id
        and trf_bvr.name not like '%Без%' 
        ;
        
        
select name, id from bo_txn_type
    where id in (
    1,
2,
4,
7,
8,
10,
11,
100001,
100002,
100003,
100005,
100007,
100009,
100010,
100021,
100022,
100023,
100025,
100027,
100480

    );
    
    Cash In 4 
    Agreement Credit 8 
    Credit (зарахування) 11