$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'seed_migrations/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.date        = '2026-02-08'
  s.name        = 'seed_migrations'
  s.version     = SeedMigrations::VERSION
  s.authors     = ['Dustin Eversmann', 'onrooby GmbH']
  s.email       = ['admin@onrooby.com']
  s.homepage    = 'http://rubygems.org/gems/seed_migrations'
  s.summary     = 'Extension of seed behaviour for rails applications'
  s.description = 'Handle seeding like migrating'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 3.2'

  s.add_runtime_dependency 'rails', '~> 8.1'
end
