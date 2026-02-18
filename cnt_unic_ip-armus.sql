select a.ip_addr,
   count(a.ip_addr) cnt
  from armus_hosts a--, zbx_hosts z
  group by ip_addr
order by cnt desc  
-- where a.ip_addr = SUBSTRING(z.zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' );
