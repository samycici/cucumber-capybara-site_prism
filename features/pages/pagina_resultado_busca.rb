# encoding: utf-8
#!/usr/bin/env ruby

class ResultadoBusca < SitePrism::Page

  elements :lista_ofertas, ".ec-offers-results > div"
  element :primeira_oferta, ".ec-offers-results > div > a:first-of-type"

end
