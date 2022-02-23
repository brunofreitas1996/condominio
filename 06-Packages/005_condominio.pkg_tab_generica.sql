create or replace package condominio.pkg_tab_generica is

procedure prc_ins_tab_generica (  p_tab_generica_id out condominio.tab_generica.tab_generica_id%type
                                , p_codigo          in  condominio.tab_generica.codigo%type
                                , p_descricao       in  condominio.tab_generica.descricao%type
                                );

procedure prc_alt_tab_generica (  p_tab_generica_id in  condominio.tab_generica.tab_generica_id%type
                                , p_codigo          in  condominio.tab_generica.codigo%type
                                , p_descricao       in  condominio.tab_generica.descricao%type
                                );

procedure prc_del_tab_generica ( p_tab_generica_id     in  condominio.tab_generica.tab_generica_id%type);

end;
/
create or replace package body condominio.pkg_tab_generica is

procedure prc_ins_tab_generica  ( p_tab_generica_id out condominio.tab_generica.tab_generica_id%type
                                , p_codigo          in  condominio.tab_generica.codigo%type
                                , p_descricao       in  condominio.tab_generica.descricao%type
                                )
is 

begin

  insert into condominio.v_tab_generica
              (codigo, descricao)
              values
              (p_codigo, p_descricao)
              returning tab_generica_id into p_tab_generica_id;

exception
  when others then
    raise_application_error(-20000, 'Não foi possivel inserir o registro');
end;

procedure prc_alt_tab_generica  ( p_tab_generica_id in  condominio.tab_generica.tab_generica_id%type
                                , p_codigo          in  condominio.tab_generica.codigo%type
                                , p_descricao       in  condominio.tab_generica.descricao%type
                                )
is
begin

update condominio.v_tab_generica
   set codigo     = p_codigo
     , descricao  = p_descricao
 where tab_generica_id = p_tab_generica_id;
 
exception
  when no_data_found then
       raise_application_error(-20000, 'Registro com ID: '||p_tab_generica_id||', não foi encontrado.');
  when others then
       raise_application_error(-20000, 'Não foi possivel alterar o registro');
end;

procedure prc_del_tab_generica ( p_tab_generica_id     in  condominio.tab_generica.tab_generica_id%type)
is
begin
  delete condominio.v_tab_generica 
   where tab_generica_id = p_tab_generica_id;
end;  

end;
/
