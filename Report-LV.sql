select * 
  from zbx_hosts 
 where ( 
-- lviv
            zbx_tags like '%LV_ICMP%'
         or zbx_tags like '%UG_ICMP%'
         or zbx_tags like '%IF_ICMP%'
         or zbx_tags like '%TR_ICMP%'
         or zbx_tags like '%HM_ICMP%'
         or zbx_tags like '%CV_ICMP%'
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
