# confcodigo-website
Desenvolvimento do site para gerir as conferências, proposições de temas,  inscrições  para assitir as apresentações de temas etc, etc ..
# Índice
- ## [Introdução](#intro)
- ## [Descrição](#descr)
- ## [Requisitos necessidades e especificações](#rne)
- ## [Convenções e regras de programação](#guia)
- ## [Contribuir](#contr)

# <a name="intro"></a> Introdução

***ConfCodigo*** é um projeto que visa criar uma conferência de programadores angolanos com o intuito de partilhar experiências profissionais, particulares, e desafios vividos ou encontrados num projeto. 

Informática, Computação, programação, desenvolvimento de software são área muito vastas e passionantes, e acreditamos que nos próximos anos estas áreas serão cruciais para o desenvolvimento do nosso país. Assim, também acreditamos que uma das formas de respondermos as necessidades para o desenvolvimento do país com estas áreas tão dinâmicas é partilhando experiências, desafios e conhecimentos

>“A partilha de conhecimentos é o acto de amizade mais fundamental. Porque é uma forma de dar algo sem perder algo.” *-Richard Stallman*

>“Creio que conhecimento é poder, mas apenas se for a ser partilhado.” *-Desconhecido*

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
