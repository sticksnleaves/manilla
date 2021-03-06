# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'manilla/version'

Gem::Specification.new do |spec|
  spec.name          = 'manilla'
  spec.version       = Manilla::VERSION
  spec.authors       = ['Anthony Smith']
  spec.email         = ['anthony@sticksnleaves.com']

  spec.summary       = 'Keep your text nice and tidy'
  spec.description   = 'Break long logical lines of text into multiple
                        delimited representations'
  spec.homepage      = 'https://github.com/sticksnleaves/manilla.git'
  spec.license       = 'MIT'

  spec.files         = (
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(/^(test|spec|features)\//)
    end
  )

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
