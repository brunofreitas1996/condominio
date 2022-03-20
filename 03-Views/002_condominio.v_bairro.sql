-- condominio.v_bairro
create or replace view condominio.v_bairro as
select bairro_id
     , nm_bairro
     , dt_insert 
from condominio.bairro;
