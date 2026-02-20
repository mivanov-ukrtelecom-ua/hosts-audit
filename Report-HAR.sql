select * 
  from zbx_hosts 
 where (    zbx_tags like '%HR_ICMP%'
         or zbx_tags like '%PL_ICMP%'
		 or zbx_tags like '%SU_ICMP%'
         or zbx_tags like '%CG_ICMP%'
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
