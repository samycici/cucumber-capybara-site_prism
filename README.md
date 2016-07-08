## Configurando o ambiente ##
### Ativar rbenv 2.3.1 ###
Execute o seguinte comando:
```shell
rbenv local 2.3.1
```

### Instalando as gems ###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle install
```

### Drivers necessários: ###
Instalar [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/) e [phantomjs](http://phantomjs.org/)

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

### Executando os testes em PROD usando Chrome###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p chrome -p prod
```

### Executando os testes em PROD usando Firefox###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p firefox -p prod
```

### Executando os testes em PROD usando Poltergeist###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p poltergeist -p prod
```

### Gerando relatório HTML###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p html_report
```
