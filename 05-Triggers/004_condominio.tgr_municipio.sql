-- condominio.tgr_municipio.sql
create or replace trigger condominio.tgr_municipio  
   before insert on condominio.municipio
   for each row 
begin  
   if inserting then 
      if :NEW.municipio_id is null then 
         select condominio.seq_municipio.nextval into :NEW.municipio_id from dual; 
      end if; 
   end if; 
end;
/
