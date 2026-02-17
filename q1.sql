select a.unic_name, a.ip_addr
  from armus_hosts a, zbx_hosts z
 where a.ip_addr = SUBSTRING(z.zbx_interface,'([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})' );
