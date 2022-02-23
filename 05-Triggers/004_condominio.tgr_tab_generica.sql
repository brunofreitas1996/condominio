-- condominio.tgr_tab_generica.sql
create or replace trigger condominio.tgr_tab_generica  
   before insert on condominio.tab_generica
   for each row 
begin  
   if inserting then 
      if :NEW.tab_generica_id is null then 
         select condominio.seq_tab_generica.nextval into :NEW.tab_generica_id from dual; 
      end if; 
   end if; 
end;
/
