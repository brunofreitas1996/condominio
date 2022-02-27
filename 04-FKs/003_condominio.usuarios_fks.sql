-- condominio usu_gen_fk.sql
alter table condominio.usuarios
add constraint usu_gen_fk foreign key (st_tab_generica_id)
references condominio.tab_generica (tab_generica_id);
/
-- condominio apa_gen_fk1.sql
alter table condominio.usuarios
add constraint apa_gen_fk1 foreign key (tp_tab_generica_id)
references condominio.tab_generica (tab_generica_id);
/
