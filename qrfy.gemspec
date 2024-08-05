# frozen_string_literal: true

require_relative "lib/qrfy/version"

Gem::Specification.new do |spec|
  spec.name = "qrfy"
  spec.version = Qrfy::VERSION
  spec.authors = ["Wojciech Zygmuntowicz"]
  spec.email = ["wojciech.zygmuntowicz@geeknauts.com"]

  spec.summary = "Wrapper for qrfy.com API."
  spec.description = "A really simple wrapper for qrfy.com API written in pure ruby."
  spec.homepage = "https://github.com/w-zygmuntowicz/qrfy"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.8"

  spec.metadata["allowed_push_host"] = spec.homepage

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
