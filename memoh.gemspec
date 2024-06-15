# frozen_string_literal: true

require_relative "lib/memoh/version"

Gem::Specification.new do |spec|
  spec.name = "memoh"
  spec.version = Memoh::VERSION
  spec.authors = ["Matias Salles"]
  spec.email = ["matiassalles99@gmail.com"]

  spec.summary = "Save your SSH connection details with memoh"
  spec.description = "Save your SSH connection details with memoh and connect to any saved host by name"
  spec.homepage = "https://github.com/matiassalles99/memoh"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/matiassalles99/memoh"
  spec.metadata["changelog_uri"] = "https://github.com/matiassalles99/memoh/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables << "memoh"
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", "~> 7.1", ">= 7.1.3.3"
  spec.add_dependency "activesupport", "~> 7.1", ">= 7.1.3.3"
  spec.add_dependency "colorize", "~> 1.1"
  spec.add_dependency "thor", "~> 1.3", ">= 1.3.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
