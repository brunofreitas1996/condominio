create or replace view condominio.v_agen_assembleia as
select agen_assem_id
     , dt_prevista
     , hr_prevista
     , sindico_id
     , dt_insert 
  from condominio.agen_assembleia;
