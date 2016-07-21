###### Dado #####
Dado (/^que eu esteja na home de busca$/) do
  @busca = Busca.new
  @busca.visit(CONFIG['url'])
end

Dado(/^que eu faça uma busca por um curso$/) do
  @busca.selecionar_cursos(CONFIG['curso1'])
  @resultado_busca = @busca.clicar_btn_buscar
end

Dado(/^que eu faça uma busca por um estado$/) do
  @busca.selecionar_estado(CONFIG['estado2'])
  @resultado_busca = @busca.clicar_btn_buscar
end

###### Quando #####

Quando(/^eu clico na imagem do resultado de busca desse curso$/) do
  @link_btn_inscrevase_primeira_oferta = @resultado_busca.lista_btn_inscrevase.first['href']
  @resultado_busca.lista_imagens_ofertas.first.click
end

Quando(/^eu filtro pela modalidade "([^"]*)"$/) do |modalidade|
  @resultado_busca.filtro.selecionar_filtro(modalidade)
end

Quando(/^eu filtro pela mensalidade "([^"]*)"$/) do |mensalidade|
  @resultado_busca.filtro.selecionar_filtro(mensalidade)
end

Quando(/^eu filtro pela forma de ingresso "([^"]*)"$/) do |forma_ingresso|
  @resultado_busca.filtro.selecionar_filtro(forma_ingresso)
end

Quando(/^eu filtro pelo turno "([^"]*)"$/) do |turno|
  @resultado_busca.filtro.selecionar_filtro(turno)
end

Quando(/^eu filtro pela formação "([^"]*)"$/) do |formacao|
  @resultado_busca.filtro.selecionar_filtro(formacao)
end

Quando(/^eu faço uma busca e ordeno o resultado de A\-Z$/) do
  @busca.selecionar_estado(CONFIG['estado1'])
  @busca.selecionar_cursos(CONFIG['curso1'])
  @resultado_busca = @busca.clicar_btn_buscar
  @resultado_busca.clicar_btn(@resultado_busca.ordenar_a_z)
end

Quando(/^eu faço uma busca e ordeno o resultado de Z\-A$/) do
  @busca.selecionar_estado(CONFIG['estado1'])
  @busca.selecionar_cursos(CONFIG['curso1'])
  @resultado_busca = @busca.clicar_btn_buscar
  @resultado_busca.clicar_btn(@resultado_busca.ordenar_z_a)
end

Quando(/^eu faço uma busca que não tenha ofertas disponíveis$/) do
  @busca.selecionar_estado(CONFIG['estado1'])
  @busca.selecionar_cursos(CONFIG['curso3'])
  @resultado_busca = @busca.clicar_btn_buscar

  @resultado_busca.selecionar_filtro("Presencial")
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

Então(/^visualizo a lista de resultados correspondente ao range de mensalidade "([^"]*)" escolhida$/) do |mensalidade|
  lista = @resultado_busca.get_lista_mensalidades
  range = @resultado_busca.get_range_mensalidades(mensalidade)

  # expect(lista.size).to eq(10)
  expect(lista).to all_list_elements_between(range)
end

Então(/^visualizo a lista de resultados correspondente ao tipo de forma de ingresso "([^"]*)" escolhida$/) do |forma_ingresso|
  lista = @resultado_busca.get_lista_forma_ingresso
  forma_ingresso_resultado = @resultado_busca.get_forma_ingresso(forma_ingresso)
  expect(lista.size).to eq(10)
  expect(lista).to all_list_elements_eq(forma_ingresso_resultado)
end

Então(/^visualizo a lista de resultados correspondente ao tipo turno "([^"]*)" escolhido$/) do |turno|
  lista = @resultado_busca.get_lista_turnos
  turnos_disponiveis = @resultado_busca.get_turnos_disponiveis(turno)
  expect(lista.size).to eq(10)
  expect(lista).to all_list_elements_include(turnos_disponiveis)
end

Então(/^visualizo a lista de resultados correspondente à formação "([^"]*)" escolhida$/) do |tipo_formacao|
  lista = @resultado_busca.get_lista_tipos_formacao
  expect(lista.size).to eq(10)
  expect(lista).to all_list_elements_eq(tipo_formacao)
end

Então(/^o primeiro curso apresentado possui a primeira letra A$/) do
  first_item = @resultado_busca.lista_titulo_ofertas.first.text[0]
  expect(first_item).to eq("A")
end

Então(/^o último curso apresentado possui a primeira letra A$/) do
  first_item = @resultado_busca.lista_titulo_ofertas.last.text[0]
  expect(first_item).to eq("A")
end

Então(/^visualizo a página de (\d+) resultados de busca$/) do |resultado|
  expect(@resultado_busca.count_cursos_encontrados.text).to eq("0 cursos encontrados, com total de 0 resultados")
  expect(@resultado_busca.msg_busca_zero_resultados.text).to eq("Desculpe, não encontramos cursos para a sua busca.")
end
