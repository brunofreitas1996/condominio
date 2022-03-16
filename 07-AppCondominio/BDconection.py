import cx_Oracle

class banco_de_dados():
    def conecta_bd(self):
        try:
            self.conn = cx_Oracle.connect(user="SYSTEM", password="oracle", dsn="localhost/xe"); print('Banco de Dados conectado')
            self.cursor = self.conn.cursor()
        except:
            print('Não foi possivel conectar ao banco de dados, verifique suas configurações')

    def desconecta_bd(self):
        self.conn.close(); print('Banco de Dados desconectado')

    def insUsuario(self, v_nome, v_nr_cad_unico, v_dt_nascimento, v_senha):
        self.conecta_bd()
        self.v_pessoa_id = self.cursor.var(int)
        self.v_usuarios_id = self.cursor.var(int)
            
        self.cursor.callproc("condominio.pkg_pessoa.prc_ins_pessoa",[self.v_pessoa_id, v_nome, v_nr_cad_unico, v_dt_nascimento])
        self.cursor.callproc("condominio.pkg_usuarios.prc_ins_usuarios",[self.v_usuarios_id, v_nr_cad_unico, v_senha, 13, 10])
            
        self.conn.commit()
        self.desconecta_bd()
        
    def validaLogin(self, v_user, v_senha):
        self.conecta_bd()

        self.v_result = self.cursor.var(int)
        self.cursor.callproc("condominio.pkg_login.prc_valida_login", [v_user, v_senha, self.v_result])

        self.desconecta_bd()
        return self.v_result.getvalue()
    
    def altSenha(self, v_cpf_cnpj, v_dt_nasc, v_nova_senha):
        self.conecta_bd()
        self.v_result = self.cursor.var(int)
        self.cursor.callproc("condominio.pkg_login.prc_alt_senha",[v_cpf_cnpj, v_dt_nasc, v_nova_senha, self.v_result])
        self.conn.commit()
        self.desconecta_bd()
        return self.v_result.getvalue()

        
