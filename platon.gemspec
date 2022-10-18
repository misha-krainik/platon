$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'platon/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'platon.ua'
  spec.version     = Platon::VERSION
  spec.authors     = ['Mikhail Krainik']
  spec.email       = ['mikhail.krainik@gmail.com']
  spec.homepage    = 'http://github.com/'
  spec.summary     = 'Platon processing center.'
  spec.description = 'Platon processing center.'
  spec.license     = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files = Dir['spec/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "rails", "~> 5"
  spec.add_dependency "jbuilder", "~> 2.6"

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'jbuilder'
  spec.add_development_dependency 'rails-controller-testing'
  spec.add_development_dependency 'faraday'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'pry'
end
