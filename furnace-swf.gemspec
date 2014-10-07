# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'furnace-swf'

Gem::Specification.new do |s|
  s.name        = "furnace-swf"
  s.version     = Furnace::SWF::VERSION
  s.authors     = ["Peter Zotov", "Sergey Gridassov"]
  s.email       = ["whitequark@whitequark.org", "grindars@gmail.com"]
  s.homepage    = "http://github.com/whitequark/furnace-swf"
  s.summary     = %q{Flash SWF file reader and writer}
  s.description = %q{furnace-swf allows one to load, modify and write back } <<
                  %q{Flash SWF files. It can be used with furnace-avm2 in } <<
                  %q{order to achieve impressive results.}

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.9.1'

  s.add_runtime_dependency "bindata", '~> 1.6.0'
  s.add_runtime_dependency "trollop"
end
