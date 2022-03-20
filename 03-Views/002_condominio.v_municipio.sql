-- condominio.v_municipio
create or replace view condominio.v_municipio as
select municipio_id
     , nm_municipio
     , uf
     , pais
     , dt_insert 
  from condominio.municipio;
