# encoding: utf-8
# !/usr/bin/env ruby
class Busca < SitePrism::Page
  element :busca_curso, '.multiselect-control.form-control'
  element :campo_curso, 'input.multiselect-search-field'
  element :espaco_branco, 'div.multiselect-dropdown > div.multiselect-options > div > span'
  element :btn_buscar, '.btn.btn-default.btn-lg.btn-block.pull-right'

  def selecionar_curso(curso)
    busca_curso.click
    campo_curso.set curso
    espaco_branco.click
    busca_curso.click
  end

  def clicar_btn_buscar
    btn_buscar.click
    sleep 5
    ResultadoBusca.new
  end
end
