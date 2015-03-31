Gem::Specification.new do |s|
  s.name = 'flicks'
  s.version = '1.0.0'
  s.author = 'me'
  s.email = ''
  s.summary = 'Plays and reviews movies'
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.homepage = ''
  s.files = Dir['{bin,lib,spec}/**/*'] + %w(LICENSE README)
  s.executables = ['flicks']
  s.required_ruby_version = '>=2.1.5'
  s.add_development_dependency 'rspec'
end
