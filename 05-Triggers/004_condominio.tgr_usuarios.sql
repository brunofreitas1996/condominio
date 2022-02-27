-- condominio.tgr_usuarios.sql
create or replace trigger condominio.tgr_usuarios  
   before insert on condominio.usuarios
   for each row 
begin  
   if inserting then 
      if :NEW.usuarios_id is null then 
         select condominio.seq_usuarios.nextval into :NEW.usuarios_id from dual; 
      end if; 
   end if; 
end;
/
