-- condominio apa_blo_fk.sql
alter table condominio.apartamento
add constraint apa_blo_fk foreign key (bloco_id)
references condominio.bloco (bloco_id);
/
-- condominio apa_gen_fk.sql
alter table condominio.apartamento
add constraint apa_gen_fk foreign key (tp_tab_generica_id)
references condominio.tab_generica (tab_generica_id);
/
