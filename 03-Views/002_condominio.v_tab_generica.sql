-- condominio.v_tab_generica.sql
create or replace view condominio.v_tab_generica as
select 
       tab_generica_id
     , codigo
     , descricao
     , dt_insert
  from condominio.tab_generica;
