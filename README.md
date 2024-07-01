# QuakeLogDetail

QuakeLogDetail foi uma gem que criei para o desafio da CouldWalk

## Instalação

Adicione esta linha ao seu Gemfile:

```ruby
gem 'quake_log_detail', git: 'https://github.com/lairtonmendes/quake_log_detail.git'
```

Depois, execute:
```ruby
bundle install
```

## Instalação Manual(Recomendada)

Se preferir, pode instalar manualmente a gem a partir do repositório GitHub usando bundler:
```ruby
bundle add quake_log_detail --git 'https://github.com/lairtonmendes/quake_log_detail.git'
```

## Uso

Depois de instalar a gem, você pode usá-la da mesma forma como faria se estivesse instalada localmente:

```ruby
require 'quake_log_detail'

# Analisar um arquivo de log
details = QuakeLogDetail.details('qgames.log') # você pode usar o arquivo padrão

# Exibir o scoreboard
QuakeLogDetail.scoreboard('qgames.log') # você pode usar o arquivo padrão
```
