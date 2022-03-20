-- condominio.v_apartamento.sql
create or replace view condominio.v_apartamento as
select 
       apartamento_id
     , bloco_id
     , nr_andar
     , nr_apartamento
     , tp_tab_generica_id
     , endereco_id
     , complemento
     , dt_insert
 from condominio.apartamento;
