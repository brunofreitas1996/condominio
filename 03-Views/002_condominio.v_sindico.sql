-- condominio.v_sindico
create or replace view condominio.v_sindico as
select sindico_id
     , dt_inicio
     , dt_fim
     , pessoa_id
     , dt_insert 
  from condominio.sindico;
