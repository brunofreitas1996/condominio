-- condominio.tgr_inadimplencia.sql
create or replace trigger condominio.tgr_inadimplencia  
   before insert on condominio.inadimplencia
   for each row 
begin  
   if inserting then 
      if :NEW.inadimplencia_id is null then 
         select condominio.seq_inadimplencia.nextval into :NEW.inadimplencia_id from dual; 
      end if; 
   end if; 
end;
/
