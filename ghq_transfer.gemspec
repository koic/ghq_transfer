$:.push File.expand_path('../lib', __FILE__)

require 'ghq_transfer/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'ghq_transfer'
  s.summary = 'Transfer local repositories from flatten directory style to ghq convention style.'
  s.description = 'Transfer local repositories from flatten directory style to ghq convention style.'

  s.version = GhqTransfer::VERSION

  s.license = 'MIT'

  s.authors = ['Koichi ITO']
  s.email = 'koic.ito@gmail.com'
  s.homepage = 'http://github.com/koic/ghq_transfer'

  s.files = Dir[
    'README.md',
    'lib/**/*',
    'bin/ghq_transfer',
    'LICENSE'
  ]
  s.require_paths = ['lib']
  s.executables = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f) }

  s.required_ruby_version = '>= 2.1.0'
end
