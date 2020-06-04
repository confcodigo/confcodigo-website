from abc import abstractmethod
import sqlite3
class CCAcessoBD(object):
    @abstractmethod
    def abrirConexao(self):
        pass
    @abstractmethod
    def fecharConexao(self):
        pass
    @abstractmethod
    def selectionar(self,sql=None):
        pass
    @abstractmethod
    def actualizar(self,sql=None):
        pass
    @abstractmethod
    def inserir(self,sql=None):
        pass
    @abstractmethod
    def apagar(self,sql=None):
        pass
    @abstractmethod
    def executar(self,sql=None):
        pass


class CCBaseDeDados(CCAcessoBD):
    import sqlite3
    conexaoCorrente = None
    canalDeConexaoCorrente = None
    def __init__(self,canalDeConexaoBB):
        self.canalDeConexaoCorrente = canalDeConexaoBB

    def abrirConexao(self):
        self.conexaoCorrente = sqlite3.connect(self.canalDeConexaoCorrente,
                                        detect_types = sqlite3.PARSE_DECLTYPES)
    
    
    def fecharConexao(self):
        self.conexaoCorrente.close()
    
    def selectionar(self,sql=None):
        '''
            Codigo para fazer um select e retornar o resultado
        '''
    
    def actualizar(self,sql=None):
        '''
            Codigo para fazer um update e retornar o resultado
        '''
    
    def inserir(self,sql=None):
        '''
            Codigo para fazer um insert e retornar o resultado
        '''
    
    def apagar(self,sql=None):
        '''
            Codigo para fazer um delete e retornar o resultado
        '''
    
    def executar(self,sql=None):
        '''
            Codigo para fazer uma interrogaçao geral( slect, insert , update, delete, select view, function , trigger etc etc) e retornar o resultado
        '''
