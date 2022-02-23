create or replace package condominio.pkg_condomino is

procedure prc_ins_condomino (   p_condomino_id       out  condominio.condomino.condomino_id%type
                              , p_apartamento_id      in  condominio.condomino.apartamento_id%type
                              , p_pessoa_id           in  condominio.condomino.pessoa_id%type
                              , p_dt_inicio           in  condominio.condomino.dt_inicio%type
                              , p_dt_fim              in  condominio.condomino.dt_fim%type
                              , p_vl_porcent          in  condominio.condomino.vl_porcent%type
                              , p_tp_tab_generica_id  in  condominio.condomino.tp_tab_generica_id%type
                              );

procedure prc_alt_condomino (   p_condomino_id        in  condominio.condomino.condomino_id%type
                              , p_apartamento_id      in  condominio.condomino.apartamento_id%type
                              , p_pessoa_id           in  condominio.condomino.pessoa_id%type
                              , p_dt_inicio           in  condominio.condomino.dt_inicio%type
                              , p_dt_fim              in  condominio.condomino.dt_fim%type
                              , p_vl_porcent          in  condominio.condomino.vl_porcent%type
                              , p_tp_tab_generica_id  in  condominio.condomino.tp_tab_generica_id%type
                              );

procedure prc_del_condomino ( p_condomino_id     in  condominio.condomino.condomino_id%type);

end;
/
create or replace package body condominio.pkg_condomino is

procedure prc_ins_condomino ( p_condomino_id     out condominio.condomino.condomino_id%type
                              , p_apartamento_id      in  condominio.condomino.apartamento_id%type
                              , p_pessoa_id           in  condominio.condomino.pessoa_id%type
                              , p_dt_inicio           in  condominio.condomino.dt_inicio%type
                              , p_dt_fim              in  condominio.condomino.dt_fim%type
                              , p_vl_porcent          in  condominio.condomino.vl_porcent%type
                              , p_tp_tab_generica_id  in  condominio.condomino.tp_tab_generica_id%type
                              )
is 
v_existe_pessoa      integer;
v_existe_tp          integer;
v_existe_apartamento integer;
begin

v_existe_pessoa      := condominio.pkg_verifica.fnc_existe_pessoa_id(p_pessoa_id);
v_existe_apartamento := condominio.pkg_verifica.fnc_existe_apartamento_id(p_apartamento_id);
v_existe_tp          := condominio.pkg_verifica.fnc_existe_tipo(p_tp_tab_generica_id);

 if v_existe_pessoa = 0 then
    raise_application_error(-20000, 'Pessoa com ID:'||p_pessoa_id||' não existe.');
 end if;
 if v_existe_apartamento = 0 then
    raise_application_error(-20000, 'Apartamento com ID:'||p_pessoa_id||' não existe.');
 end if;
 if v_existe_tp = 0 then
    raise_application_error(-20000, 'Tipo com ID:'||p_pessoa_id||' não existe.');
 end if; 

  insert into condominio.v_condomino
              (apartamento_id, pessoa_id, dt_inicio, dt_fim, vl_porcent, tp_tab_generica_id)
              values
              (p_apartamento_id, p_pessoa_id, p_dt_inicio, p_dt_fim, p_vl_porcent, p_tp_tab_generica_id)
              returning condomino_id into p_condomino_id;

exception
  when others then
    raise_application_error(-20000, 'Não foi possivel inserir o registro');
end;

procedure prc_alt_condomino  (  p_condomino_id        in  condominio.condomino.condomino_id%type
                              , p_apartamento_id      in  condominio.condomino.apartamento_id%type
                              , p_pessoa_id           in  condominio.condomino.pessoa_id%type
                              , p_dt_inicio           in  condominio.condomino.dt_inicio%type
                              , p_dt_fim              in  condominio.condomino.dt_fim%type
                              , p_vl_porcent          in  condominio.condomino.vl_porcent%type
                              , p_tp_tab_generica_id  in  condominio.condomino.tp_tab_generica_id%type
                              )
is
begin

update condominio.v_condomino
   set apartamento_id     = p_apartamento_id
     , pessoa_id          = p_pessoa_id
     , dt_inicio          = p_dt_inicio
     , dt_fim             = p_dt_fim
     , vl_porcent         = p_vl_porcent
     , tp_tab_generica_id = p_tp_tab_generica_id
 where condomino_id = p_condomino_id;
 
exception
  when no_data_found then
       raise_application_error(-20000, 'Registro com ID: '||p_condomino_id||', não foi encontrado.');
  when others then
       raise_application_error(-20000, 'Não foi possivel alterar o registro');
end;

procedure prc_del_condomino ( p_condomino_id     in  condominio.condomino.condomino_id%type)
is
begin
  delete condominio.v_condomino 
   where condomino_id = p_condomino_id;
end;  

end;
/
