# language: pt

Funcionalidade: Buscar um curso
  Para continuar o processo de inscrição,
  Como candidato,
  Quero buscar um curso

  Contexto: Home de Busca
    Dado que eu esteja na home de busca

  @velho
  Cenário: Ir para página de inscrições de um curso a partir da imagem do curso
    A partir da imagem das ofertas resultantes da Busca
    O usuário deve poder ir para a página de inscrição daquele curso
    Com os mesmos parâmetros do botão de Inscreva-se

    Dado que eu faça uma busca por um curso
    Quando eu clico na imagem do resultado de busca desse curso
    Então sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado

  @velho
  Cenário: Fazer uma busca ordenada de A a Z
    Quando eu faço uma busca e ordeno o resultado de A-Z
    Então o primeiro curso apresentado possui a primeira letra A

  @velho
  Cenário: Fazer uma busca ordenada de Z a A
    Quando eu faço uma busca e ordeno o resultado de Z-A
    Então o último curso apresentado possui a primeira letra A

  @velho
  Cenário: Fazer uma busca que não tenha resultados
    Quando eu faço uma busca que não tenha ofertas disponíveis
    Então visualizo a página de 0 resultados de busca

  @velho
  Esquema do Cenário: Filtrar resultado de busca por Modalidade

      Dado que eu faça uma busca por um curso
      Quando eu filtro pela modalidade "<modalidade>"
      Então visualizo a lista de resultados correspondente ao tipo de modalidade "<modalidade>" escolhida

      Exemplos: Modalidades
        | modalidade    |
        | Presencial    |
        | A Distância   |
        | Flex          |
        | Telepresencial|

  @novo
  Esquema do Cenário: Filtrar resultado de busca por Mensalidade
      Dado que eu faça uma busca por um estado
      Quando eu filtro pela mensalidade "<mensalidade>"
      Então visualizo a lista de resultados correspondente ao range de mensalidade "<mensalidade>" escolhida

      Exemplos: Mensalidades
        | mensalidade      |
        | Até R$199        |
        | R$200 a R$399    |
        | R$400 a R$699    |
        | R$700 a R$999    |
        | Acima de R$1.000 |

  @novo
  Esquema do Cenário: Filtrar resultado de busca por Forma de Ingresso
      Dado que eu faça uma busca por um estado
      Quando eu filtro pela forma de ingresso "<forma_de_ingresso>"
      Então visualizo a lista de resultados correspondente ao tipo de forma de ingresso "<forma_de_ingresso>" escolhida
      Exemplos: Forma de Ingresso
        | forma_de_ingresso |
        | Vestibular        |
        | ENEM              |
        | Transferência     |
        | Segunda Graduação |

  @novo
  Esquema do Cenário: Filtrar resultado de busca por Turno
      Dado que eu faça uma busca por um estado
      Quando eu filtro pelo turno "<turno>"
      Então visualizo a lista de resultados correspondente ao tipo turno "<turno>" escolhido
      Exemplos: Turno
        | turno |
        | Manhã |
        | Tarde |
        | Noite |

  @novo
  Esquema do Cenário: Filtrar resultado de busca por formação
      Dado que eu faça uma busca por um estado
      Quando eu filtro pela formação "<formacao>"
      Então visualizo a lista de resultados correspondente à formação "<formacao>" escolhida
      Exemplos: Tipo de Formação
        | formacao     |
        | Bacharelado  |
        | Licenciatura |
        | Tecnológica  |
