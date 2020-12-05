# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "phpstats-docs"
  spec.version       = "0.0.1"
  spec.authors       = ["Petr Makhnev"]
  spec.email         = ["mr.makhneff@gmail.com"]

  spec.summary       = %q{Documentation for PhpStats}
  spec.homepage      = "https://github.com/i582/phpstats-docs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|bin|_layouts|_includes|lib|Rakefile|_sass|LICENSE|README)}i) }
  spec.executables   << 'phpstats-docs'

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_runtime_dependency "jekyll", ">= 3.8.5"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.0"
  spec.add_runtime_dependency "rake", ">= 12.3.1", "< 13.1.0"

end
