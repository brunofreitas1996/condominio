create or replace package condominio.pkg_apartamento is

procedure prc_ins_apartamento ( p_apartamento_id    out  condominio.apartamento.apartamento_id%type
                              , p_bloco_id           in  condominio.apartamento.bloco_id%type
                              , p_nr_andar           in  condominio.apartamento.nr_andar%type
                              , p_nr_apartamento     in  condominio.apartamento.nr_apartamento%type
                              , p_tp_tab_generica_id in  condominio.apartamento.tp_tab_generica_id%type
                              , p_endereco_id        in  condominio.apartamento.endereco_id%type
                              , p_complemento        in  condominio.apartamento.complemento%type
                              );

procedure prc_alt_apartamento ( p_apartamento_id     in  condominio.apartamento.apartamento_id%type
                              , p_bloco_id           in  condominio.apartamento.bloco_id%type
                              , p_nr_andar           in  condominio.apartamento.nr_andar%type
                              , p_nr_apartamento     in  condominio.apartamento.nr_apartamento%type
                              , p_tp_tab_generica_id in  condominio.apartamento.tp_tab_generica_id%type
                              , p_endereco_id        in  condominio.apartamento.endereco_id%type
                              , p_complemento        in  condominio.apartamento.complemento%type                              
                              );

procedure prc_del_apartamento ( p_apartamento_id     in  condominio.apartamento.apartamento_id%type);

end;
/
create or replace package body condominio.pkg_apartamento is

procedure prc_ins_apartamento ( p_apartamento_id     out condominio.apartamento.apartamento_id%type
                              , p_bloco_id           in  condominio.apartamento.bloco_id%type
                              , p_nr_andar           in  condominio.apartamento.nr_andar%type
                              , p_nr_apartamento     in  condominio.apartamento.nr_apartamento%type
                              , p_tp_tab_generica_id in  condominio.apartamento.tp_tab_generica_id%type
                              , p_endereco_id        in  condominio.apartamento.endereco_id%type
                              , p_complemento        in  condominio.apartamento.complemento%type                              
                         )
is 
v_existe_apartamento integer;
v_existe_tp          integer;
begin

v_existe_apartamento := condominio.pkg_verifica.fnc_existe_apartamento(p_bloco_id, p_nr_apartamento, p_nr_andar);
v_existe_tp          := condominio.pkg_verifica.fnc_existe_tipo(p_tp_tab_generica_id);

 if v_existe_apartamento = 0 and v_existe_tp > 0 then
  insert into condominio.v_apartamento
              (bloco_id, nr_andar, nr_apartamento, tp_tab_generica_id, endereco_id, complemento)
              values
              (p_bloco_id, p_nr_andar, p_nr_apartamento, p_tp_tab_generica_id, p_endereco_id, p_complemento)
              returning apartamento_id into p_apartamento_id;
 else
  raise_application_error(-20000, 'Este apartamento já existe, ou o tipo informado não existe.');
 end if;

exception
  when others then
    raise_application_error(-20000, 'Não foi possivel inserir o registro');
end;

procedure prc_alt_apartamento ( p_apartamento_id     in  condominio.apartamento.apartamento_id%type
                              , p_bloco_id           in  condominio.apartamento.bloco_id%type
                              , p_nr_andar           in  condominio.apartamento.nr_andar%type
                              , p_nr_apartamento     in  condominio.apartamento.nr_apartamento%type
                              , p_tp_tab_generica_id in  condominio.apartamento.tp_tab_generica_id%type
                              , p_endereco_id        in  condominio.apartamento.endereco_id%type
                              , p_complemento        in  condominio.apartamento.complemento%type                              
                         )
is
begin

update condominio.v_apartamento
   set bloco_id           = p_bloco_id
     , nr_andar           = p_nr_andar
     , nr_apartamento     = p_nr_apartamento
     , tp_tab_generica_id = p_tp_tab_generica_id
     , endereco_id        = p_endereco_id
     , complemento        = p_complemento
 where apartamento_id = p_apartamento_id;
 
exception
  when no_data_found then
       raise_application_error(-20000, 'Registro com ID: '||p_apartamento_id||', não foi encontrado.');
  when others then
       raise_application_error(-20000, 'Não foi possivel alterar o registro');
end;

procedure prc_del_apartamento ( p_apartamento_id     in  condominio.apartamento.apartamento_id%type)
is
begin
  delete condominio.v_apartamento 
   where apartamento_id = p_apartamento_id;
end;  

end;
/
