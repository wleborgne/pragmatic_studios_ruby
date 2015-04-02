Gem::Specification.new do |s|
  s.name = 'studio_game'
  s.version = '1.0.0'
  s.author = 'Bill LeBorgne'
  s.email = 'bill@leborgne.name'
  s.homepage = 'http://www.leborgne.name/devblog'
  s.summary = 'Pragmatic Studio Ruby course'
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses = ['MIT']
  s.files = Dir['{bin,lib,spec}/**/*'] + %w(LICENSE README)
  s.test_files = Dir['spec/**/*']
  s.executables = ['studio_game']
  s.required_ruby_version = '>=2.1.5'
  s.add_development_dependency 'rspec'
end
