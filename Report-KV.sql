select * 
  from zbx_hosts 
 where ( 
-- kiev
            zbx_tags like '%KV_ICMP%'
         or zbx_tags like '%ZT_ICMP%'
         or zbx_tags like '%RV_ICMP%'
         or zbx_tags like '%LC_ICMP%'
) 
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
