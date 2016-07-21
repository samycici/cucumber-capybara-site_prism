# encoding: utf-8
# !/usr/bin/env ruby
require_relative 'section_filtros.rb'

class ResultadoBusca < SitePrism::Page
  elements :lista_ofertas, '#main > div > div > main > div > div.col-md-9 > div:nth-child(4) > section'
  elements :lista_titulo_ofertas, "div.rmq-c4ecc7e4.rmq-722042ff.rmq-2c87bfe9 > div.rmq-24e418e4"
  elements :lista_imagens_ofertas, '.ec-offers-results > div > a:nth-child(1)'
  elements :lista_btn_inscrevase, '#\32 > div.rmq-6c18f325.rmq-e47c285f.rmq-9a5cfdcc > div > a.rmq-4d8a5834.btn.btn-primary'
  elements :lista_modalidades, '#\32 > div.rmq-c4ecc7e4.rmq-722042ff.rmq-2c87bfe9 > div.rmq-c92128c6 > div:nth-child(3) > div > span:nth-child(2)'
  elements :lista_mensalidades, "div.rmq-6c18f325.rmq-e47c285f.rmq-9a5cfdcc > p > span.rmq-7abb7b0e"
  elements :lista_forma_ingresso, "div.rmq-c4ecc7e4.rmq-722042ff.rmq-2c87bfe9 > div.rmq-c92128c6 > div:nth-child(5) > div > span:nth-child(2)"
  elements :lista_turnos, "div.rmq-c4ecc7e4.rmq-722042ff.rmq-2c87bfe9 > div.rmq-c92128c6 > div:nth-child(4) > div > span:nth-child(2)"
  elements :lista_tipos_formacao, "div.rmq-c4ecc7e4.rmq-722042ff.rmq-2c87bfe9 > div.rmq-c92128c6 > div:nth-child(1) > div > span:nth-child(2)"

  element :ordenar_a_z, "#main > div > div > main > div.row > div.col-md-9 > div:nth-child(4) > div > a:nth-child(2)"
  element :ordenar_z_a, "#main > div > div > main > div.row > div.col-md-9 > div:nth-child(4) > div > a:nth-child(3)"

  element :count_cursos_encontrados, "#main > div > div > main > div.row > div.col-md-9 > form > div:nth-child(6) > div.hidden-xs > div.col-md-8 > div"
  element :msg_busca_zero_resultados, "#main > div > div > main > div.row > div.col-md-9 > div:nth-child(4) > div > h3:nth-child(2)"
  section :filtro, FiltroSection, "#main > div > div > main > div.row > div.col-md-3 > aside > div > div.filter-result > div.filter-result-body"


  def selecionar_filtro(filtro)
    page.execute_script("document.querySelector('input[label=\"#{filtro}\"]').click()")
    sleep 3
  end

  def get_lista_modalidades
    modalidades = lista_modalidades.map {|modalidade| modalidade.text}
  end

  def get_lista_mensalidades
    mensalidades = lista_mensalidades.map {|mensalidade| mensalidade.text}
  end

  def get_lista_forma_ingresso
    formas_ingresso = lista_forma_ingresso.map {|forma_ingresso| forma_ingresso.text}
  end

  def get_lista_turnos
    turnos = lista_turnos.map {|turno| turno.text}
  end

  def get_lista_tipos_formacao
    tipos_formacao = lista_tipos_formacao.map {|formacao| formacao.text}
  end

  def get_range_mensalidades mensalidade
    mensalidades = {
      "Até R$199" => [0, 199],
      "R$200 a R$399" => [200, 399],
      "R$400 a R$699" => [400, 699],
      "R$700 a R$999" => [700, 999],
      "Acima de R$1.000" => [1000, 10000]
    }
    mensalidades[mensalidade]
  end

  def get_forma_ingresso forma_ingresso
    formas_ingresso = {
      "Vestibular" => "Vestibular",
      "ENEM" => "ENEM",
      "Transferência" => "Transferência",
      "Segunda Graduação" => "2ª Graduação"
    }
    formas_ingresso[forma_ingresso]
  end

  def get_turnos_disponiveis turno
    [turno, "virtual"]
  end

  def clicar_btn btn
    btn.click
    sleep 5
    ResultadoBusca.new
  end
end
