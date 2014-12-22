$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_grid_system/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap-grid-system"
  s.version     = BootstrapGridSystem::VERSION
  s.authors     = "Nikolay-Lipovtsev"
  s.email       = "n.lipovtsev@gmail.com"
  s.homepage    = "http://github.com/Nikolay-Lipovtsev/bootstrap-grid-system"
  s.summary     = "Bootstrap Grid System allows to simply generate div blocks with Bootstrap columns"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0"

  s.add_development_dependency "sqlite3", "~> 1.3"
end
