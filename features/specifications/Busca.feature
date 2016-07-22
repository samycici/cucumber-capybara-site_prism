# language: pt

Funcionalidade: Buscar um curso
  Para continuar o processo de inscrição,
  Como candidato,
  Quero buscar um curso

  Contexto: Home de Busca
    Dado que eu esteja na home de busca

  Cenário: Ir para página de inscrições de um curso a partir da imagem do curso
    A partir da imagem das ofertas resultantes da Busca
    O usuário deve poder ir para a página de inscrição daquele curso
    Com os mesmos parâmetros do botão de Inscreva-se

    Dado que eu faça uma busca por um curso
    Quando eu clico na imagem do resultado de busca desse curso
    Então sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado

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
