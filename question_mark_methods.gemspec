# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'question_mark_methods/version'

Gem::Specification.new do |gem|
  gem.name          = "question_mark_methods"
  gem.version       = QuestionMarkMethods::VERSION
  gem.authors       = ["Roy Young"]
  gem.email         = ["zhuoyuyang@gmail.com"]
  gem.description   = %q{give boolean attribute a question mark method}
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
