-- condominio.con_pes_fk.sql
alter table condominio.condomino
add constraint con_pes_fk foreign key (pessoa_id)
references condominio.pessoa (pessoa_id);
/
-- condominio.con_apa_fk.sql
alter table condominio.condomino
add constraint con_apa_fk foreign key (apartamento_id)
references condominio.apartamento (apartamento_id);
/
-- condominio.con_gen_fk.sql
alter table condominio.condomino
add constraint con_gen_fk foreign key (tp_tab_generica_id)
references condominio.tab_generica (tab_generica_id);
/

