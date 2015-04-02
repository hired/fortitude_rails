$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'fortitude_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'fortitude_rails'
  s.version     = FortitudeRails::VERSION
  s.authors     = ['Winfred Nadeau', 'Aaron Resiman', 'Andrew Evans']
  s.email       = ['winfred@liberat.us', 'aaron@hired.com', 'andrew@atevans.com']
  s.homepage    = 'http://fortitude.io'
  s.summary     = 'A rails engine for building fortitude style guides'
  s.description = 'A rails engine for building fortitude style guides'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '< 5'
  s.add_dependency 'fortitude-sass'
  s.add_dependency 'haml-rails'
  s.add_dependency 'coderay'
  s.add_dependency 'html2haml'
  s.add_dependency 'htmlbeautifier'
  s.add_dependency 'redcarpet'

  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'sqlite3'

end
