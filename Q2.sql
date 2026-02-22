select * 
  from zbx_hosts 
 where not( 
-- dnipro
            zbx_tags like '%DP_ICMP%'
         or zbx_tags like '%ZP_ICMP%'
         or zbx_tags like '%CK_ICMP%'
         or zbx_tags like '%KG_ICMP%'
         or zbx_tags like '%DC_ICMP%'  --???
-- odesa
         or zbx_tags like '%OD_ICMP%'
         or zbx_tags like '%MK_ICMP%'
         or zbx_tags like '%VC_ICMP%'
         or zbx_tags like '%HS_ICMP%'
-- harkiv
         or zbx_tags like '%HR_ICMP%'
         or zbx_tags like '%PL_ICMP%'
         or zbx_tags like '%SU_ICMP%'
         or zbx_tags like '%CG_ICMP%'
-- kiev
         or zbx_tags like '%KV_ICMP%'
         or zbx_tags like '%ZT_ICMP%'
         or zbx_tags like '%RV_ICMP%'
         or zbx_tags like '%LC_ICMP%'
-- lviv
         or zbx_tags like '%LV_ICMP%'
         or zbx_tags like '%UG_ICMP%'
         or zbx_tags like '%IF_ICMP%'
         or zbx_tags like '%TR_ICMP%'
         or zbx_tags like '%HM_ICMP%'
         or zbx_tags like '%CV_ICMP%'
)
--   and regexp_match(zbx_hostname, '^dp-|^zp-|^ck-|^kg-|^dc-', 'i')      IS NOT NULL  --  dnipro
--   and regexp_match(zbx_hostname, '^od-|^mk-|^vc-|^hs-', 'i')           IS NOT NULL  --  odesa
--   and regexp_match(zbx_hostname, '^hr-|^pl-|^su-|^cg-', 'i')           IS NOT NULL  --  harkiv
--   and regexp_match(zbx_hostname, '^kv-|^zt-|^rv-|^lc-', 'i')           IS NOT NULL  --  kiev
--   and regexp_match(zbx_hostname, '^lv-|^ug-|^if-|^tr-|^hm-|^cv-', 'i') IS NOT NULL  --  lviv

   and SUBSTRING(zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' ) in (
  
SELECT  
       SUBSTRING(zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' ) as IP_Addr
--	   zbx_interface, 
--	   zbx_availability, 
--	   zbx_status
--     zbx_hostname
FROM zbx_hosts z
 WHERE zbx_status = 'Enabled'

EXCEPT

select a.ip_addr
  from armus_hosts a
 where a.ip_addr is not NULL
)
