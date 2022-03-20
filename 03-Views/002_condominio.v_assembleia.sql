-- condominio.v_assembleia
create or replace view condominio.v_assembleia as
select assembleia_id
     , dt_assembleia
     , hr_inicio
     , hr_fim
     , qtd_condominos
     , agen_assem_id
     , desc_assembleia
     , dt_insert 
  from condominio.assembleia;
