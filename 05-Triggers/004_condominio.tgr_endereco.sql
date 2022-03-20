-- condominio.tgr_endereco.sql
create or replace trigger condominio.tgr_endereco  
   before insert on condominio.endereco
   for each row 
begin  
   if inserting then 
      if :NEW.endereco_id is null then 
         select condominio.seq_endereco.nextval into :NEW.endereco_id from dual; 
      end if; 
   end if; 
end;
/
