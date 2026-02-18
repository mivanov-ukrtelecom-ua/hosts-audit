SELECT  
--     zbx_hostname, 
       count(SUBSTRING(zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' )) as cnt,
       SUBSTRING(zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' ) as IP_Addr
--	   zbx_interface, 
--	   zbx_availability, 
--	   zbx_status
  FROM zbx_hosts z
 WHERE zbx_status = 'Enabled'
group by IP_Addr
order by cnt
