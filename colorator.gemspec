Gem::Specification.new do |spec|
  spec.name = 'colorator'
  spec.version = '0.1'
  spec.date = '2013-04-13'
  spec.license = 'MIT'
  spec.authors  = ["Parker Moore", "Brandon Mathis"]
  spec.description = "Colorize your text in the terminal."
  spec.summary = "String core extensions for terminal coloring."
  spec.email    = ["parkrmoore@gmail.com", "brandon@imathispec.com"]
  spec.files = %W(Rakefile Gemfile LICENSE README.markdown) + Dir["{lib,bin}/**/*"]
  spec.homepage = 'https://github.com/octopress/colorator'
  spec.extra_rdoc_files = %w[README.markdown LICENSE]
  spec.rdoc_options = ["--charset=UTF-8"]
  spec.require_paths = %w[lib]

  spec.add_development_dependency(
    "rspec", '~> 3.1'
  )
end
