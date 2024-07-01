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

## Como testar

Como a gem não está publicada, recomendo clonar o projeto e rodar com bin/console
```bash
bin/console
```

## Uso

Depois de instalar a gem ou usar o `bin/console`, você pode usar:

```ruby
require 'quake_log_detail'

# Analisar um arquivo de log
details = QuakeLogDetail.details('qgames.log') # você pode usar o arquivo padrão

# Exibir o scoreboard
QuakeLogDetail.scoreboard('qgames.log') # você pode usar o arquivo padrão
```
