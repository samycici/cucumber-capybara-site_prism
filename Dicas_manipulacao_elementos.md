# Dicas de manipulação de elementos

-  Criar uma page

```ruby
class Home < SitePrism::Page
end
```

-  Criar uma section

```ruby
class Menu < SitePrism::Section
end
```

-  Navegar para url

```ruby
visit(url)
```

-  Localizar um elemento

```ruby
element :campo_busca, "input[name='q']"
```

-  Localizar uma lista de elementos

```ruby
elements :cursos, "ul#cursos li a"
```

-  Acessar um elemento

```ruby
@home = Home.new
@home.campo_busca
```

-  Preencher um campo

```ruby
@home.campo_busca.set valor
```

-  Clicar em um elemento

```ruby
@home.btn_buscar.click
```

-  Recuperar o texto de um elemento

```ruby
@home.cursos.text
```

-  IFrames

```ruby
class Iframe < SitePrism::Page
  element :campo, "input.username"
end

class PaginaComIframe < SitePrism::Page
  iframe :meu_iframe, Iframe, "#iframe_id"
end
```

Mais informações:
- SitePrism - https://github.com/natritmeyer/site_prism
- Capybara - https://github.com/jnicklas/capybara
