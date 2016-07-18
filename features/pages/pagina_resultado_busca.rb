# encoding: utf-8
# !/usr/bin/env ruby
require_relative 'section_filtros.rb'

class ResultadoBusca < SitePrism::Page
  elements :lista_ofertas, '#main > div > div > main > div > div.col-md-9 > div:nth-child(4) > section'
  elements :lista_imagens_ofertas, '.ec-offers-results > div > a:nth-child(1)'
  elements :lista_btn_inscrevase, '#\32 > div.rmq-6c18f325.rmq-e47c285f.rmq-9a5cfdcc > div > a.rmq-4d8a5834.btn.btn-primary'
  elements :lista_modalidades, '#\32 > div.rmq-c4ecc7e4.rmq-722042ff.rmq-2c87bfe9 > div.rmq-c92128c6 > div:nth-child(3) > div > span:nth-child(2)'
  section :filtro, FiltroSection, "#main > div > div > main > div.row > div.col-md-3 > aside > div > div.filter-result > div.filter-result-body"

  def get_lista_modalidades
    modalidades = lista_modalidades.map {|modalidade| modalidade.text}
  end
end
