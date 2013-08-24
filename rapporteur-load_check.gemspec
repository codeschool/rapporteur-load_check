# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rapporteur-load_check"
  spec.version       = "2.1.0"
  spec.authors       = ["Envy Labs", "Code School"]
  spec.email         = [""]
  spec.description   = %q{Machine load reporting for rapporteur}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"
  spec.add_dependency "rapporteur", ">= 2.0", "< 4.0", "!= 3.0.0"

  spec.add_development_dependency "appraisal", "~> 0.5"
  spec.add_development_dependency "combustion", "~> 0.5"
  spec.add_development_dependency "rails", "~> 3.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails", "~> 2.11"
end
