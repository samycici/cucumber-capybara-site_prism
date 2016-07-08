Dado(/^que eu esteja na home de busca$/) do
  @busca = Busca.new
  @busca.visit($config['url'])
end

Dado(/^que eu faça uma busca por um curso$/) do
  @busca.selecionar_curso($config['um_curso']['curso'])
  @resultado_busca = @busca.clicar_btn_buscar
end

Quando(/^eu clico na imagem do resultado de busca desse curso$/) do
  @link_btn_inscrevase_primeira_oferta = @resultado_busca.lista_btn_inscrevase.first['href']
  @resultado_busca.lista_imagens_ofertas.first.click
end

Então(/^sou redirecionado para a página de inscrições com os parâmetros referentes ao curso buscado$/) do
  expect(@link_btn_inscrevase_primeira_oferta).to eq @resultado_busca.current_url
end
