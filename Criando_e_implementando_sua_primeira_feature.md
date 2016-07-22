# Features, Steps e Page Objects

## Criando sua primeira feature

Dentro da pasta ```features/specifications``` crie o seu arquivo com a extensão .feature. Nesse projeto temos como o exemplo o arquivo ```features/specifications/Busca.feature```

Nesse arquivo você irá especificar cenários para essa funcionalidade, como no exemplo:

```ruby
Funcionalidade: Buscar um curso
  Para continuar o processo de inscrição,
  Como candidato,
  Quero buscar um curso

  Cenário: Fazer uma busca com resultados
    Dado que esteja na home de busca
    Quando realizo uma busca pelo curso "Eventos"
    Então visualizo uma lista de resultados sobre o curso "Eventos"
```

Depois de salvar o arquivo, basta executar:

```ruby
bundle exec cucumber
```

## Criando seus steps

Como o cenário ainda não está implementado, o cucumber vai mostrar no console a seguinte saída:

```ruby
Dado(/^que esteja na home de busca$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando(/^realizo uma busca pelo curso "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Então(/^visualizo uma lista de resultados sobre o curso "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
```

Isso significa que ele reconheceu o cenário que foi criado, porém não existem steps implementados. Basta colar essa saída dentro de um arquivo na pasta ```features/step_definitions```, no nosso caso temos o arquivo ```features/step_definitions/busca_steps.rb```.

Ao executar novamente:

```ruby
bundle exec cucumber
```

A saída do console muda para:

```ruby
1 scenario (1 pending)
3 steps (2 skipped, 1 pending)
0m0.009s
```

Ou seja, seus steps foram reconhecidos mas faltam ser implementados.

## Criando seus page objects

Para saber mais sobre Page Objects: http://martinfowler.com/bliki/PageObject.html

Agora, como último passo, você precisa implementar os steps com as ações necessárias para executar sua especificação.

Para isso, você deve criar dentro de ```features/pages``` os seus arquivos que serão uma representação das páginas da sua aplicação.

No nosso exemplo, temos 2 páginas:
- ```features/pages/pagina_busca.rb``` que é a página inicial onde preenchemos os critérios da busca;
- ```features/pages/pagina_resultado_busca.rb``` que é a página onde temos os resultados da busca realizada, ou seja, a página que aparece depois de clicar no botão de buscar.

e 1 section:
-  ```features/pages/section_filtros.rb``` aqui estão os filtros da busca que podem ser utilizados tanto na página de busca quanto na de resultados. Por ser um elemento comum, ele é um section.

Dentro desses arquivos estarão todas as interações com os elementos da página, como por exemplo:
- localizar elementos;
- preencher campos;
- clicar em botões;
- recuperar um texto da tela;

Os métodos desses arquivos serão chamados no corpo dos steps.

## Voltando aos steps

No fim, seus steps ficarão parecidos com isso:

```ruby
Dado(/^que esteja na home de busca$/) do
  @busca = Busca.new
  @busca.visit(CONFIG['url'])
end

Quando(/^realizo uma busca pelo curso "([^"]*)"$/) do |curso|
  @resultado_busca = @busca.buscar_curso(curso)
end

Então(/^visualizo uma lista de resultados sobre o curso "([^"]*)"$/) do |curso|
  resultados = @resultado_busca.get_resultados
  expect(resultados.size).to eq(10)
  expect(resultados).to all_list_elements_eq(curso)
  ... e tantos outros expects que podem ser utilizados
end
```

## [Ir para Dicas de manipulação de elementos](Dicas_manipulacao_elementos.md)
