select a.ip_addr
  from armus_hosts a
 where a.ip_addr is not NULL

EXCEPT

SELECT  
       SUBSTRING(zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' ) as IP_Addr
--	   zbx_interface, 
--	   zbx_availability, 
--	   zbx_status
--     zbx_hostname
FROM zbx_hosts z
 WHERE zbx_status = 'Enabled'
--group by IP_Addr
order by IP_Addr
