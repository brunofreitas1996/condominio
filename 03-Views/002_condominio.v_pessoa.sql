-- condominio.v_pessoa.sql
create view condominio.v_pessoa as 
select 
       pessoa_id
     , nome
     , nr_cad_unico
     , dt_nascimento
     , dt_insert
  from condominio.pessoa;
