-- condominio.v_endereco
create or replace view condominio.v_endereco as
select endereco_id
     , municipio_id
     , nm_logradouro
     , tp_logradouro
     , cep
     , bairro_id
     , dt_insert 
  from condominio.endereco;
