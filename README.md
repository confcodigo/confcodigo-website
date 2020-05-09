# confcodigo-website
Desenvolvimento do site para gerir as conferências, proposições de temas,  inscrições  para assitir as apresentações de temas etc, etc ..
 
 <img width="880" height = "200" alt = "Conferencia Codigo"
    src="https://github.com/confcodigo/confcodigo-website/blob/master/logo/confcodigo.jpg">

# Índice
- ## [Introdução](#intro)
- ## [Descrição](#descr)
- ## [Requisitos necessidades e especificações](#rne)
- ## [Convenções e estilo de programação](#guia)
- ## [Contribuir](#contr)

# <a name="intro"></a> Introdução

***ConfCodigo*** é um projeto que visa criar uma conferência de programadores angolanos com o intuito de partilhar experiências profissionais, particulares, e desafios vividos ou encontrados num projeto. 

Informática, Computação, programação, desenvolvimento de software são áreas muito vastas e passionantes, e acreditamos que nos próximos anos estas áreas serão cruciais para o desenvolvimento do nosso país. Assim, também acreditamos que uma das formas de respondermos as necessidades para o desenvolvimento do país com estas áreas tão dinâmicas é partilhando experiências, desafios e conhecimentos

>“A partilha de conhecimentos é o acto de amizade mais fundamental. Porque é uma forma de dar algo sem perder algo.” *-Richard Stallman*

>“Creio que conhecimento é poder, mas apenas se for partilhado.” *-Desconhecido*

Aqui vão algumas ideias que podem ser partilhadas na conferência :

- Partilha de experiências profissionais gerais
- Partilha de experiências de projetos profissionais
- Partilhas de experiências em projetos pessoais
- Desafios e proposições de novas implementações de conceitos
- Boas práticas

Objectivo é partilhar, partilhar, partilhar para crescer mais rápido

# <a name="descr"></a> Descrição

Este repositório não se trata da conferência em geral, mas sim da construção do website que vai nos ajudar a gerir a conferência de forma autônoma.

Este software/website está na sua primeira versão oficial. As interfaces podem mudar em resposta às reacções dos utilizadores. Para alterações recentes veja aqui …. **ficheiro sera actualizado quando existir** 

Em geral o website deve gerir as proposições de temas feito pelas pessoas que querem partilhar experiências, também deve avaliar cada tema proposto e selecionar os mais pertinentes, gerir inscrição dos apresentadores, gerir inscrição dos espectadores a um tema de seu interesse.

O website deve ser autônomo, ele deve saber gerir-se sozinho e não precisar de muita intervenção humana. Para isso precisamos de ideias geniais como a sua.

Para saber exatamente o que falta ser implementado e como deve funcionar o website dirija-se para a seção [Requisitos necessidades e especificações](https://github.com/confcodigo/confcodigo-website#descr)

# <a name="rne"></a> Requisitos necessidades e especificações

## Especificações e exigências funcionais Gerais
- Gerir actividades da conferência **ConfCodigo**
  - Anúncios
  - Vídeos da conferência
  - Feedbacks com visitantes, participantes ou patrocinadores
- Gerir  proposições de temas com experiências a partilhar
  - Temas  que serão apresentados
- Permitir ao Painel de Admin, aprovar ou reprovar as proposições segundo a pertinência
  - Especificar Política de pertinência ???
  - 1- Voto pelo painel/Admin  ( segundo critérios da conferência)
  - 2- Voto pelas pessoas que estão interessado ou pelo número de inscritos no tema em questão
- Criação de conta para se inscrever num tema deve ser opcional
  - Formulário particular para digitar informações pessoais na hora de inscrição
- Possibilidade dos interessados se inscreverem num ou vários temas
- Possibilidades de membro da comunidade/site proporem temas


## Identificação de Categorias de utilizadores
| Entidade  | Categoria/Papel/Grupo | Descrição |
| ------------- |:-------------:| :---------------|
| Visitante         | Visitante | Vai utilizar o site para conhecer/informar-se do que o projeto/site se trata |
| Inscrito      | Utilizador   | Utilizará o site para procurar e inscrever-se em temas do seu interesse. Poderá participar em votos de temas em que ele se inscrever |
| Espectador        | Utilizador     | Pessoa que assistira à uma  conferência. Pessoa confirmada, presente na apresentação |
| Sugestor  | Utilizador        |  Utilizará o site para submeter suas propostas para uma possível apresentação. Terá número limitado de proposta a fazer |
| Apresentador     | Utilizador    | Pessoa que vai apresentador um ou vários temas. Confirmado. |
| Animador     | Utilizador    | Pessoa que vai animar a conferência completa. Utilizará o site para ter acesso aos apresentadores e temas |
| Membro     | Utilizador    | Alguém que se inscreve no site para fazer parte da comunidade (poderá, propor temas, participar a sondagens ) |
| Admin     | Administrador    | Membros Activo, e avaliadores de proposta. Estes também poderão participar activamente fazendo apresentação, ou assistindo  a apresentações |


Para obter mais detalhes sobre as funcionalidades a implementar consulta a lista de User Story a concretizar aqui : [TODO LIST](https://github.com/confcodigo/confcodigo-website/projects/1) 

# <a name="contr"></a> Contribuir

Se quiser contribuir para a o desenvolvimento do website e ajudar-nos a manter uma qualidade elevada e considerável, considere a possibilidade de efectuar revisões e testes de unitários de código fazendo primeiro um pull request. Qualquer feedback dos utilizadores e interessados, mesmo perguntas simples sobre como as coisas funcionam ou porqué foram feitas de uma certa forma, poderá ser usado para melhorar o funcionamento autônomo do website. A revisão de códigos e testes proporcionam estes benefícios:

- Identificar bugs
- Ajustar as interfaces de acordo com os casos de utilização 
- Simplificar o código
- Performance, rapidez

Você pode consultar os pedidos de pull request fechados para ter uma idéia de como as revisões são realizadas. Para dar uma revisão de código basta entrar com a sua conta GitHub e depois adicionar comentários a qualquer pedido de pull request, ou criar um novo issue, não seja tímido!

# <a name="guia"></a> Convenções e estilo de programação
 
Nesta seção daremos guias e conselhos do estilo de programação adotado neste projeto, e que você também deve adotar para poder dar o seu contributo e levar este projeto a conhecer o sucesso.

Os comentários e sugestões de melhorias são muito bem-vindos. Tencionamos modificar e alargar esta secção à medida que a nossa compreensão melhora e que a linguagem *Python*, e o framework *Flask* melhoram. Ao comentar, por favor tome nota da introdução que traça os nossos objectivos e abordagem geral.

**Atenção** :
- Os conjuntos de regras não foram completamente verificados quanto à sua integridade, coerência ou aplicabilidade.
- Quando você ver os três pontos de interrogação (???) significa que há informações desconhecidas ou falta precisão e exatidão
- é necessário actualizar certas regras de acordo o site de referência do *Flask* ou *Python*; muitas fontes pré-Python3 (anteriores ao python3) são demasiado antigas.
- Para uma lista mais ou menos actualizada, siga a as regras abaixo

Queremos que este projeto seja um grande sucesso, e para um software conhecer o sucesso, este, tem de ser flexível e adaptar-se com as mudanças ao longo do do tempo.

## Regra 1 : Módulos
Uma das formas de garantir sucesso é construir o nosso website de forma modular, por isso módulo é a primeira convenção a adoptar neste projeto, mas como ? 

É sabido que para alcançar modularidade em *python* é preciso escrever funcionalidades relacionadas em único ficheiro, ou classe, e também a habilidade de diferenciar o que é inteiramente novo, e o que pertence ao framework.

Então aqui vão duas convenções a adoptar para nomeação assegurar modularidade :
- R.1.1 : Uma e somente uma classe por ficheiro, e uma classe deve ter somente uma única Responsabilidade.

Por exemplo para uma classe que descreve o comportamento de interação de um membro com a **base de dados** deveria ser assim :
ficheiro : *ccmembro.py*
```python
class CCMembro(object):
 ‘’’ 
 Todo codigo relacionado com um membro
 ‘’’
```
- R.1.2 : Funcionalidades que não representam modularidade possíveis em formato de classe, devem ser posta em um único ficheiro.

Por exemplo um se quisermos desenvolver funcionalidades que convertem data universais em data locais,ou textos em datas, isto não é preciso desenvolver uma classe, podemos resolver este problema com função. Como esta funcão nao precisa ir numa classe dedicada, então metemos ela num ficheiro comum que trata-se de formatagem de datas ou texto etc.

Nome do ficheiro : *ccformatagens.py*
```python
#Função que converte texto em data
def CCconverterTextoEmData(dataEmTexto):
  # codigo para converter o texto em data vai aqui...
 return textoConvertido

#Função que converte data em texto
def CCconverterDataEmTexto(data):
 # codigo para converter data em texto vai aqui ...
 return dataConvertida
```

## Regra 2 : Nome de ficheiros, Nome de classes e funções 

Como disse anteriormente uma das das formas de conseguir modularidade é poder diferenciar o que é inteiramente novo, e o que pertence de base ao framework. Para diferenciar precisamos nomear nossas funcionalidades de uma forma particular , aqui vão algumas convenções :

- R.2.0 : Todos nomes devem começar com **CC** (*ConfCodigo*), para sabermos que se trata de uma funcionalidade desenvolvida por nós, e que não pertence ao framework.
- R.2.1 : Nome de ficheiros devem refletir o tipo de funcionalidades que o módulo oferece(ou seja, o que se tém dentro). Nome de ficheiros devem ser( tudo minúsculo). Devem começar com *cc* (minúsculo) e seguido do nome desejado(minúsculo), por exemplo supondo que *formatagens* é o nome desejado então o nosso ficheiro será nomeado assim : *cc**formatagens**.py*
- R.2.2 : Nome de classes devem começar por letra maiúscula, e devem ser precedidos com **CC** (também maiúsculas). 
    Por exemplo, se for uma classe para o utilizador, então a nomeação será assim.  
Nome do ficheiro : *ccutilizador.py*
```python
class CCUtilizador(object):
    pass
```
- R.2.3 : Nome do ficheiro de uma classe é simplesmente o nome da classe mas tudo em minúsculo. Por exemplo para classe *CCUtilizador* o nome do ficheiro seria : ***ccutilizador.py*** 
