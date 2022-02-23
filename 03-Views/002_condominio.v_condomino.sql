-- condominio.v_condomino.sql
create or replace view condominio.v_condomino as
select 
       condomino_id
     , apartamento_id
     , pessoa_id
     , dt_inicio
     , dt_fim
     , vl_porcent
     , tp_tab_generica_id
     , dt_insert
  from condominio.condomino;
