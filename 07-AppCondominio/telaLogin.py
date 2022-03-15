from tkinter import *
import BDconection as bds
from Colors import *


root = Tk()
class bd():
    def insUsuario(self):
        print("Cadastrando usuario")
        self.bds = self.conecta_bd()
        self.nome = self.innome.get()
        self.nrcad = self.innrcad.get()
        self.dtnas = self.indtnasc.get()
        self.senha = self.insenha.get()
        print(self.nome)
        print(self.nrcad)
        print(self.dtnas)
        print(self.senha)

        #bds.insUsuario(self.nome, self.nrcad, self.dtnas, self.senha)
        #bds.conecta_bd().conn.commit()
        self.bds.desconecta_bd()



class Application(Colors, bd):
    def __init__(self):
        self.root = root
        self.configTela()
        self.Login()
        #self.Cadastro()


        root.mainloop()

    def configTela(self):
        self.root.title('Login')
        self.root.configure(bg=self.bg)
        self.root.geometry('700x500')
        self.root.resizable(True,True)
        self.root.maxsize(width=700, height=500)
        self.root.minsize(width=500, height=300)

    def Login(self):
        self.frlogin = Frame(self.root, bd=1, bg=self.bg1)
        self.frlogin.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)

        #Caixas de entrada

        self.lblUser  = Label(self.frlogin, bg=self.bg1, text='Usuário', fg=self.fgText)
        self.lblUser.place(relx=0.10, rely=0.31)
        self.canvas_user = Canvas(self.frlogin, bd=0, bg=self.bg)
        self.canvas_user.place(relx=0.095, rely=0.384, relwidth=0.797, relheight=0.02)
        self.username = Entry(self.frlogin, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.username.place(relx=0.10, rely=0.35)

        self.lblPass = Label(self.frlogin, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblPass.place(relx=0.10, rely=0.43)
        self.canvas_pass = Canvas(self.frlogin, bd=0, bg=self.bg)
        self.canvas_pass.place(relx=0.095, rely=0.502, relwidth=0.797, relheight=0.02)
        self.password = Entry(self.frlogin, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.password.place(relx=0.10, rely=0.47)

        self.btnCadastro = Button(master=self.frlogin,bd=0, text='Cadastrar',font=5, fg=self.fgText,bg=self.bg, width=10, command=self.Cadastro)
        self.btnCadastro.place(relx=0.10, rely=0.59)
        self.btnLogar = Button(master=self.frlogin,bd=0, text='Entrar',font=5, fg=self.fgText, bg=self.bg, width=10)
        self.btnLogar.place(relx=0.54, rely=0.59)

        self.recuperarsenha = Label(master=self.frlogin, text='Recuperar senha', bg=self.bg1, fg=self.fgText)
        self.recuperarsenha.place(relx=0.32, rely=0.70)

    def Cadastro(self):
        #--
        self.frlogin.destroy()
        #--
        self.frcadastro = Frame(self.root, bd=1, bg=self.bg1)
        self.frcadastro.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)

        #Caixas de entrada

        self.lblNome  = Label(self.frcadastro, bg=self.bg1, text='Nome completo', fg=self.fgText)
        self.lblNome.place(relx=0.10, rely=0.07)
        self.canvas_nome = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_nome.place(relx=0.095, rely=0.145, relwidth=0.797, relheight=0.02)
        self.innome = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.innome.place(relx=0.10, rely=0.113)
        

        self.lblnrcad = Label(self.frcadastro, bg=self.bg1, text='CPF/CNPJ', fg=self.fgText)
        self.lblnrcad.place(relx=0.10, rely=0.19)
        self.canvas_nrcad = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_nrcad.place(relx=0.095, rely=0.265, relwidth=0.797, relheight=0.02)
        self.innrcad = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.innrcad.place(relx=0.10, rely=0.231)

        self.lbldtnasc  = Label(self.frcadastro, bg=self.bg1, text='Data nascimento', fg=self.fgText)
        self.lbldtnasc.place(relx=0.10, rely=0.31)
        self.canvas_dtnasc = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_dtnasc.place(relx=0.095, rely=0.384, relwidth=0.797, relheight=0.02)
        self.indtnasc = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.indtnasc.place(relx=0.10, rely=0.35)

        self.lblSenha = Label(self.frcadastro, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblSenha.place(relx=0.10, rely=0.43)
        self.canvas_senha = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_senha.place(relx=0.095, rely=0.502, relwidth=0.797, relheight=0.02)
        self.insenha = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.insenha.place(relx=0.10, rely=0.47)

        def voltalogin():
            self.frcadastro.destroy()
            self.Login()
            

        self.btnVoltar = Button(master=self.frcadastro,bd=0, text='Voltar',font=5, fg=self.fgText,bg=self.bg, width=10, command=voltalogin)
        self.btnVoltar.place(relx=0.10, rely=0.59)
        self.btnCadastrar = Button(master=self.frcadastro,bd=0, text='Cadastrar',font=5, fg=self.fgText, bg=self.bg, width=10, command=self.insUsuario)
        self.btnCadastrar.place(relx=0.54, rely=0.59)

        self.lblDuvida = Label(master=self.frcadastro, text='Dúvidas', bg=self.bg1, fg=self.fgText)
        self.lblDuvida.place(relx=0.40, rely=0.70)
        
        

Application()