# Conhecendo a estrutura do Projeto

Antes de colocar a mão na massa, vamos conhecer um pouco a estrutura do projeto:

```ruby
features
features/pages
features/specifications
features/step_definitions
features/support
features/support/config
features/support/matchers
```

Os arquivos dentro do projeto são distribuídos da seguinte forma:
- pages = arquivos de page object onde se encontra a manipulação dos elementos da tela
- specifications = arquivos .feature com as especificações das funcionalidades
- step_definitions = os steps gerados a partir das features
- support = arquivos gerais de configuração do projeto

## Configurações existentes

Nesse projeto já existem algumas configurações de execução pré-definidas. Vamos conhecer um pouco delas.

### cucumber.yml

Nesse arquivo definimos os profiles que poderão ser usados pela linha de comando do cucumber.

Exemplo - Executar os testes utilizando o firefox:

```ruby
bundle exec cucumber -p firefox
```

Ao utilizar esse esse profile, é criada uma variável de ambiente chamada BROWSER com o valor firefox. Ela será utilizada pelo Capybara para instanciar um driver do selenium com o firefox.

Exemplo - Gerar relatório html:

```ruby
bundle exec cucumber -p html_report
```

Ao utilizar esse profile, será gerado um arquivo features_report.html com o resultado da execução das features.

### support/env.rb

Nesse arquivo estão todos os ```require ``` necessários para o projeto além do registro dos diferentes tipos de drivers do selenium que podem ser utilizados.

### support/hooks.rb

Nos hooks estão definidos os ```Before``` e ```After``` que o cucumber vai executar antes e depois, respectivamente, de cada feature, cenário ou step.

No ```Before``` temos:
- seleção de qual arquivo da pasta ```features/support/config``` será utilizado;
- configuração de qual driver o Capybara vai utilizar (chrome, firefox, poltergeist até o momento)
- configuração do tempo máximo de espera do Capybara.

No ```After``` temos:
- gravação de screenshot na pasta ```screenshots``` caso o cenário falhe;
- shut down da instância do driver.

### support/config

Nessa pasta estão os arquivos de configuração por ambiente. Neles você pode por exemplo definir a url para o ambiente de desenvolvimento (em um arquivo) e do ambiente de homologação (em outro arquivo), além de dados de teste específicos.

### support/matchers/custom.rb

Esse arquivo guarda os matchers customizados do RSpec.

Para saber mais: http://danielchangnyc.github.io/blog/2014/01/15/tdd2-RSpecMatchers/

## [Ir para o README](README.md)
