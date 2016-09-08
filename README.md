# cucumber-capybara-site_prism [![Circle CI](https://circleci.com/gh/samycici/cucumber-capybara-site_prism.svg?style=shield)](https://circleci.com/gh/samycici/cucumber-capybara-site_prism)
# Ordem de leitura:

1. [Conhecendo a Estrutura](Conhecendo_estrutura.md);
2. [README](README.md);
3. [Criando e Implementado sua Primeira Feature](Criando_e_implementando_sua_primeira_feature.md);
4. [Dicas de manipulação de elementos](Dicas_manipulacao_elementos.md)

## Configurando o ambiente ##

### Instalar rbenv ###
Execute o seguinte comando:
```shell
brew install rbenv
```

Inclua no ~/.bash_profile:
```shell
eval "$(rbenv init -)"
```

Listar as versões disponíveis:
```shell
rbenv install -l
```

Instalar uma versão:
```shell
rbenv install 2.3.1
```

### Ativar rbenv 2.3.1 ###
Navegar para pasta desejada e executar o seguinte comando:
```shell
rbenv local 2.3.1
```

### Instalando o bundler ###
Navegar para pasta desejada e executar o seguinte comando:
```shell
gem install bundler
```

### Instalando as gems ###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle install
```

#### Windows ####

Instale o pacote FFI
* `gem install ffi --platform ruby` (pode demorar um pouco)

### Drivers necessários: ###

* Instalar e colocar no PATH:
    * [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/)
    * [phantomjs](http://phantomjs.org/)
    * [InternetExplorerDriver](http://www.seleniumhq.org/download/) Escolha a versão correspondente 32 ou 64bit
* Instalar a extensão do [Safari para webdriver](http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz).

#### Preparando o Internet Explorer ####

1. Verifique o zoom configurado. Deve estar em 100%:
    * ![Passo 1](readme_img/step_1.png?raw=true "Verificar zoom")
2. Desabilite o 'Modo Protegido' para todas as zonas em Opções de Internet > Segurança:
    * ![Passo 2](readme_img/step_2.png?raw=true "Desabilitar 'Modo Protegido'")

### Executando os testes em DEV usando Chrome###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber
```

### Executando os testes em DEV usando Firefox###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p firefox -p dev
```

### Executando os testes em DEV usando Poltergeist###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p poltergeist -p dev
```

### Executando os testes em DEV usando Internet Explorer###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p internet_explorer -p dev
```

### Executando os testes em HMG usando Chrome###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p chrome -p hmg
```

### Executando os testes em HMG usando Firefox###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p firefox -p hmg
```
### Executando os testes em HMG usando Poltergeist###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p poltergeist -p hmg
```

### Executando os testes em HMG usando Internet Explorer###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p internet_explorer -p hmg
```

### Gerando relatório HTML###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p html_report
```

### Executando tags###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber --tags @run
```

### Rodados specs de TDD###
Execute o seguinte comando dentro de TDD:
```shell
bundle exec rspec
```

## [Ir para Criando e Implementado sua Primeira Feature](Criando_e_implementando_sua_primeira_feature.md)
