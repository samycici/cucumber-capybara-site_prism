Dado(/^que eu esteja na home de busca$/) do
  @busca = Busca.new
  @busca.load
end

Dado(/^que eu faça uma busca por um curso$/) do
  @busca.selecionar_curso("ADMINISTRAÇÃO")
  @resultado_busca = @busca.clicar_btn_buscar
end

Quando(/^eu clico na imagem do resultado de busca desse curso$/) do
  #@link_primeira_oferta = @resultado_busca.first(lista_ofertas)['href']
  primeira_oferta = @resultado_busca.lista_ofertas
  expect(@resultado_busca.lista_ofertas.size).to eq 3
  expect(primeira_oferta).to include "http://en.wikipedia.org/wiki/Sausage"

end

Então(/^sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado$/) do
  #expect(@link_primeira_oferta).to eq @resultado_busca.current_url
end
