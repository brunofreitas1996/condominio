-- condominio.v_bloco.sql
create or replace view condominio.v_bloco as
select 
     , bloco_id
     , nome
     , qtd_apartamentos
     , qtd_andares
     , dt_insert
  from condominio.bloco;
