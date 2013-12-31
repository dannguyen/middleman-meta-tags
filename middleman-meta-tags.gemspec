# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-meta-tags/version"

Gem::Specification.new do |s|
  s.name = "middleman-meta-tags"
  s.version = Middleman::MetaTags::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Dan Nguyen"]
  s.email = ["dansonguyen@gmail.com"]
  s.homepage = "https://github.com/dannguyen/middleman-meta-tags"
  s.summary = %q{Easy meta-tags for Middleman}
  s.description = %q{Easy meta-tags for Middleman}
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -z -- {fixtures,features}/*`.split("\0")
  s.require_paths = ["lib"]
  s.add_runtime_dependency("middleman-core", ["~> 3.0"])
end
