# encoding: utf-8
# !/usr/bin/env ruby
class FiltroSection < SitePrism::Section
  def selecionar_filtro(filtro)
    page.execute_script("document.querySelector('input[label=\"#{filtro}\"]').click()")
    sleep 3
  end
end
