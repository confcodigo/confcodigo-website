
'''
 Pessoas que querem implementar modulos devem herdar desta classe
 e subcarregar(override) os métodos fornecidos
'''
class CCPagina(object):
    bd = None
    precisaSessao = False
    listaDePermissoes = []
    def __init__(self,precisaSessao=False,permissoes=[],baseDeDado=None):
        self.bd = baseDeDado
        self.precisaSessao = precisaSessao
        self.listaDePermissoes = permissoes

    def cabecalho(self):
        ## Codigo para o header da pagina
        pass
    def corpo(self):
        #codigo para o body
        pass
    def rodape(self):
        ## codigo para o footer
        pass
        

    
