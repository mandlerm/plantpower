# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plantpower/version'

Gem::Specification.new do |spec|
  spec.name          = "plantpower"
  spec.version       = Plantpower::0.1
  spec.authors       = ["'Melissa Amaya'"]
  spec.email         = ["'amaya.melissa@gmail.com'"]

  spec.summary       = ["A Nokogiri scraper of the Plant Based, McDougall recipe website."]
  spec.description   = ["Allows user to search for recipies by cuisine."]
  spec.homepage      = "https://github.com/mandlerm/plantpower"
  spec.license       = "MIT"
  spec.executables << "plantpower"

  # s.files       = ["lib/worlds_best_restaurants.rb", "lib/worlds_best_restaurants/cli.rb", "lib/worlds_best_restaurants/scraper.rb", "lib/worlds_best_restaurants/restaurant.rb", "config/environment.rb"]



  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
