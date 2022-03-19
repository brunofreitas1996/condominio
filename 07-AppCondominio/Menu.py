from tkinter import Frame
from tkinter import messagebox
from Colors import *

class MenuApp(Frame):
    def menu(self):
        self.menu = Frame(bd=1, bg=self.bg1)
        self.menu.place(relx=0.01, rely=0.01, relwidth=0.98, relheight=0.98)
