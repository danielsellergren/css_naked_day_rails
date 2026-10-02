require_relative "lib/css_naked_day_rails/version"

Gem::Specification.new do |s|
  s.name        = "css_naked_day_rails"
  s.version     = CssNakedDayRails::VERSION
  s.summary     = "CSS Naked Day!"
  s.description = "Provides a Rails view helper, css_naked_day?, that is true during CSS Naked Day (April 9th, anywhere on Earth)."
  s.authors     = ["Daniel Sellergren"]
  s.email       = "dss@hey.com"
  s.files       = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  s.homepage    = "https://github.com/danielsellergren/css_naked_day_rails"
  s.license     = "MIT"
  s.metadata    = {
    "source_code_uri" => s.homepage,
    "changelog_uri" => "#{s.homepage}/blob/main/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }

  s.required_ruby_version = ">= 2.2.2"
  s.add_dependency "railties", ">= 5.0", "< 9"
end
