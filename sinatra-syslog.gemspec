# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'sinatra-syslog'
  spec.version       = '0.1.0'
  spec.authors       = ['Bachue Zhou']
  spec.email         = ['bachue.shu@gmail.com']

  spec.summary       = 'A gem to configure syslog for Sinatra 1.4.x'
  spec.description   = spec.summary
  spec.homepage      = 'http://github.com/bachue/sinatra-syslog'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'sinatra'
end
