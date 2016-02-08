# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtf_parse/version'

Gem::Specification.new do |spec|
  spec.name          = "rtf_parse"
  spec.version       = RtfParse::VERSION
  spec.authors       = ["John Perry"]
  spec.email         = ["jgperry@ajc.com"]

  spec.summary       = %q{Converts Rich Text Format (RTF) files to other formats.}
  spec.description   = %q{Converts Rich Text Format (RTF) files to other formats, such as text and html, using the unrtf GNU utility.}
  spec.license       = "MIT"
  spec.requirements  = "unrtf executable https://www.gnu.org/software/unrtf/"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "open4", "~> 1.3.4"
end
