require_relative '../pages/pagina_busca'

Dado(/^que eu esteja na home de busca$/) do
  @busca = Busca.new
  @busca.load
end

Dado(/^que eu faça uma busca por um curso$/) do
  @busca.selecionar_curso("ADMINISTRAÇÃO")
end

Quando(/^eu clico na imagem do resultado de busca desse curso$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Então(/^sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
