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
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["bug_tracker_uri"] = "https://github.com/w-zygmuntowicz/qrfy/issues"
  spec.metadata["source_code_uri"] = "https://github.com/w-zygmuntowicz/qrfy/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "https://github.com/w-zygmuntowicz/qrfy/releases/tag/v#{spec.version}"

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

  spec.add_dependency "faraday", "~> 2.0", "<= 2.8.1"
  spec.add_dependency "faraday-parse_dates", "~> 0.1", "<= 0.1.1"
end
