###### Dado #####
Dado (/^que eu esteja na home de busca$/) do
  @busca = Busca.new
  @busca.visit(CONFIG['url'])
end

Dado(/^que eu faça uma busca por um curso$/) do
  @busca.selecionar_cursos(CONFIG['curso1'])
  @resultado_busca = @busca.clicar_btn_buscar(@busca.btn_buscar)
end

###### Quando #####

Quando(/^eu clico na imagem do resultado de busca desse curso$/) do
  @link_btn_inscrevase_primeira_oferta = @resultado_busca.lista_btn_inscrevase.first['href']
  @resultado_busca.lista_imagens_ofertas.first.click
end

Quando(/^eu filtro pela modalidade "([^"]*)"$/) do |modalidade|
  @resultado_busca.filtro.selecionar_filtro(modalidade)
end

###### Então #####

Então(/^sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado$/) do
  expect(@link_btn_inscrevase_primeira_oferta).to eq @resultado_busca.current_url
end

Então(/^visualizo a lista de resultados correspondente ao tipo de modalidade "([^"]*)" escolhida$/) do |modalidade|
  lista = @resultado_busca.get_lista_modalidades
  expect(lista.size).to eq(10)
  expect(lista).to all_list_elements_eq(modalidade)
end
