-- condominio.tgr_sindico.sql
create or replace trigger condominio.tgr_sindico  
   before insert on condominio.sindico
   for each row 
begin  
   if inserting then 
      if :NEW.sindico_id is null then 
         select condominio.seq_sindico.nextval into :NEW.sindico_id from dual; 
      end if; 
   end if; 
end;
/
