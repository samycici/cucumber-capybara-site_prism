# language: pt
Funcionalidade: Buscar um curso
  Para continuar o processo de inscrição,
  Como candidato,
  Quero buscar um curso

  Contexto: Home de Busca
    Dado que eu esteja na home de busca

  Cenário: Ir para página de inscrições de um curso a partir da imagem do curso
    Dado que eu faça uma busca por um curso
    Quando eu clico na imagem do resultado de busca desse curso
    Então sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado
