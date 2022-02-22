-- condominio.v_condomino.sql
create or replace view condominio.v_condomino as
select 
       condomino_id
     , apartamento_id
     , pessoa_id
     , dt_inicio
     , dt_fim
     , vl_porcent
     , tp_dond_tab_generica
     , dt_insert
  from condominio.condomino;
