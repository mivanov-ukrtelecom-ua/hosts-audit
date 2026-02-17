-- 1.armus -> csv
-- 2.import to libre office  cyrillic(PT154) 
-- 3.copy(libre) --> paste(mousepad)
-- 4.replace ' "


DROP TABLE IF EXISTS public."armus_hosts";

CREATE TABLE public."armus_hosts"
(
    filia text,
    location_name text,
    location_addr text,
    unic_name text,
    ip_addr text,
    dev_type text,
    dev_vendor text,
    dev_model text,
    dev_formf text,
    dev_mac text,
    dev_status text,
    dev_pwr_type text,
    source_sys text,
    ext_id text,
    description text,
    ports text,
    sn text,
    hw_ver text,
    os_type text,
    os_ver text,
    login_ text,
    udhcp text,
    location_old text,
    created  text,
    modified  text
);

ALTER TABLE IF EXISTS public."armus_hosts"
    OWNER to postgres;



DROP TABLE IF EXISTS public."zbx_hosts";

CREATE TABLE public."zbx_hosts"
(
    zbx_hostname text,
    zbx_interface text,
    zbx_availability text,
    zbx_tags text,
    zbx_status text
);

ALTER TABLE IF EXISTS public."zbx_hosts"
    OWNER to postgres;
