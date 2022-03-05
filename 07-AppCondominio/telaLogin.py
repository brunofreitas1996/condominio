from tkinter import *
from Colors import *

root = Tk()





class Application(Colors):
    def __init__(self):
        self.root = root
        self.configTela()


        root.mainloop()

    def configTela(self):
        self.root.title('Login')
        self.root.configure(bg=self.bg)
        self.root.geometry('700x500')
        self.root.resizable(True,True)
        self.root.maxsize(width=700, height=500)
        self.root.minsize(width=500, height=300)


Application()