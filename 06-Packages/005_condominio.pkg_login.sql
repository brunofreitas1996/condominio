create or replace package condominio.pkg_login is

procedure prc_valida_login(p_usuario in condominio.usuarios.username%type
                          ,p_senha   in varchar2
                          ,p_result  out integer);

end;
/
create or replace package body condominio.pkg_login is

procedure prc_valida_login(p_usuario in condominio.usuarios.username%type
                          ,p_senha   in varchar2
                          ,p_result  out integer)
is
 v_user  integer := 0;
 v_senha condominio.usuarios.password%type;
begin

   select count(1) 
     into v_user
     from condominio.usuarios u
    where u.username = p_usuario;
 
 if v_user > 0 then
   begin
     select u.password
       into v_senha
       from condominio.usuarios u
      where u.username = p_usuario;
   end;
   if p_senha = v_senha then
     p_result := 1;
   else
     p_result := 9;
   end if;
 else
   p_result := 0;
 end if;
end;

end;
/
