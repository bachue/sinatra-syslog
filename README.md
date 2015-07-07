# Sinatra::Syslog

A gem to configure syslog for Sinatra 1.4.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-syslog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-syslog

## Usage

```ruby
# In config.ru
require 'sinatra-syslog'

use Sinatra::Syslog, 'myapp' if ENV['RACK_ENV'] == 'production'
run MyApp
```

## Contributing

1. Fork it ( https://github.com/bachue/sinatra-syslog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
