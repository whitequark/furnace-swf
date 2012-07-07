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

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "bindata"
  s.add_runtime_dependency "trollop"
end
