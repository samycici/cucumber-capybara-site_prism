require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

class Busca < SitePrism::Page
  set_url "http://d.busca.estacio.rj.br/"

  element :busca_curso, ".multiselect-control.form-control"
  element :campo_curso, "input.multiselect-search-field"

  def selecionar_curso(curso)
    busca_curso.click
    campo_curso.set curso
  end

end
