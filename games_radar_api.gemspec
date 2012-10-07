# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'games_radar_api/version'

Gem::Specification.new do |gem|
  gem.name          = "games_radar_api"
  gem.version       = GamesRadarApi::VERSION
  gem.authors       = ["Ashraf Vali"]
  gem.email         = ["mail@cubewebsites.com"]
  gem.description   = "Allows interaction with the Games Radar API"
  gem.summary       = "Allows interaction with the Games Radar API"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('faraday_middleware', '~> 0.8')
  gem.add_runtime_dependency('faraday', ['>= 0.7', '< 0.9'])
  gem.add_runtime_dependency('multi_xml', '>= 0.5.1')
  gem.add_runtime_dependency('hashie',  '>= 0.4.0')

  gem.add_development_dependency('turn', '~> 0.9.6')
  gem.add_development_dependency('rake', '~> 0.9.2.2')

end
