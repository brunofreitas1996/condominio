create or replace package condominio.pkg_usuarios is

procedure prc_ins_usuarios ( p_usuarios_id           out condominio.usuarios.usuarios_id%type
                              , p_username           in  condominio.usuarios.username%type
                              , p_password           in  condominio.usuarios.password%type
                              , p_st_tab_generica_id in  condominio.usuarios.st_tab_generica_id%type
                              , p_tp_tab_generica_id in  condominio.usuarios.tp_tab_generica_id%type
                              );

procedure prc_alt_usuarios ( p_usuarios_id           in  condominio.usuarios.usuarios_id%type
                              , p_password           in  condominio.usuarios.password%type
                              );

procedure prc_del_usuarios ( p_usuarios_id     in  condominio.usuarios.usuarios_id%type);

end;
/
create or replace package body condominio.pkg_usuarios is

procedure prc_ins_usuarios ( p_usuarios_id           out condominio.usuarios.usuarios_id%type
                              , p_username           in  condominio.usuarios.username%type
                              , p_password           in  condominio.usuarios.password%type
                              , p_st_tab_generica_id in  condominio.usuarios.st_tab_generica_id%type
                              , p_tp_tab_generica_id in  condominio.usuarios.tp_tab_generica_id%type
                         )
is 
v_existe_usuario integer;
v_existe_tp      integer;
v_existe_st      integer;
begin

v_existe_usuario  := condominio.pkg_verifica.fnc_existe_usuario(p_username);
v_existe_tp       := condominio.pkg_verifica.fnc_existe_tipo(p_tp_tab_generica_id);
v_existe_st       := condominio.pkg_verifica.fnc_existe_tipo(p_st_tab_generica_id);

 if v_existe_usuario = 0 and v_existe_tp > 0 and v_existe_st > 0 then
  insert into condominio.v_usuarios
              (username, password, st_tab_generica_id, tp_tab_generica_id)
              values
              (p_username, p_password, p_st_tab_generica_id, p_tp_tab_generica_id)
              returning usuarios_id into p_usuarios_id;
 else
  raise_application_error(-20000, 'Este usuario já existe, ou o tipo informado não existe.');
 end if;

exception
  when others then
    raise_application_error(-20000, 'Não foi possivel inserir o registro');
end;

procedure prc_alt_usuarios ( p_usuarios_id        in  condominio.usuarios.usuarios_id%type
                           , p_password           in  condominio.usuarios.password%type
                           )
is
begin

update condominio.v_usuarios
   set password    = p_password
 where usuarios_id = p_usuarios_id;
 
exception
  when no_data_found then
       raise_application_error(-20000, 'Registro com ID: '||p_usuarios_id||', não foi encontrado.');
  when others then
       raise_application_error(-20000, 'Não foi possivel alterar o registro');
end;

procedure prc_del_usuarios ( p_usuarios_id     in  condominio.usuarios.usuarios_id%type)
is
begin
  delete condominio.v_usuarios 
   where usuarios_id = p_usuarios_id;
end;  

end;
/
