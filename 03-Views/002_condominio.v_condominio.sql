-- condominio.v_condominio
create or replace view condominio.v_condominio as
select condominio_id
       , cnpj
       , nm_condominio
       , nr_condominio
       , complemento
       , endereco_id
       , dt_insert 
    from condominio.condominio;
