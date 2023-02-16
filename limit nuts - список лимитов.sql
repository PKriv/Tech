  SELECT ul.agreement_id     limiter_group,
         uc.AGREEMENT_ID,
         ul.code,
         uc.id UC_ID,
         uc.START_DATE, 
         uc.END_DATE,
         uc.amount,
         clnt_attr.VALUE     AS "OdbClientID"
    FROM BO_UL_LIMITER       ul,
         BO_UL_COUNTER       uc,
         bo_agreement        agr,
         CRM_CLIENT_ATTRIBUTE clnt_attr
   WHERE     ul.code IN ('AGR_CASH_XBORDER_7DAY', 'AGR_RETAIL_XBORDER_MONTH')
         AND ul.ORIGINAL_LIMITER_ID IS NULL
         AND ul.agreement_id IN (100000, 100061)
         AND uc.COUNTER_RULE_ID = ul.id
         AND (select banking_date from BO_BANKING_DATE) BETWEEN uc.START_DATE AND uc.END_DATE
         AND uc.amount <> 0
         AND agr.id = uc.AGREEMENT_ID
--         and agr.id = 160547
         AND agr.CLIENT_ID = clnt_attr.CLIENT_ID
         --      and clnt.id = clnt_attr.CLIENT_ID
         AND clnt_attr.TYPE_ID = 100000                 /* ИД клиента в ОДБ */
         AND agr.CLIENT_ID <> 100084                     /* тестовый клиент */
--         AND agr.id IN (112107,
--                        189270,
--                        204118,
--                        207295,
--                        252541,
--                        191118,
--                        194441,
--                        198153,
--                        200065,
--                        200548,
--                        200962,
--                        201199,
--                        201324)
ORDER BY uc.agreement_id;


select banking_date from BO_BANKING_DATE;