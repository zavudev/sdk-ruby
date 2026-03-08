# frozen_string_literal: true

require_relative "lib/zavudev/version"

Gem::Specification.new do |s|
  s.name = "zavudev"
  s.version = Zavudev::VERSION
  s.summary = "Ruby library to access the Zavudev API"
  s.authors = ["Zavudev"]
  s.email = "hi@zavu.dev"
  s.homepage = "https://gemdocs.org/gems/zavudev"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/stainless-sdks/zavudev-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
