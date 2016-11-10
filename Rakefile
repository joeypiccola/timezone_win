require 'rubygems'
require 'bundler/setup'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet/version'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

exclude_paths = [
  "spec/**/*",
]

Rake::Task[:lint].clear

PuppetLint.configuration.relative = true
PuppetLint.configuration.disable_arrow_alignment
PuppetLint.configuration.disable_80chars
PuppetLint.configuration.disable_class_inherits_from_params_class
PuppetLint.configuration.disable_class_parameter_defaults
PuppetLint.configuration.disable_documentation
PuppetLint.configuration.disable_single_quote_string_with_variables
PuppetLint.configuration.fail_on_warnings = true

PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = exclude_paths
end

PuppetSyntax.exclude_paths = exclude_paths

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
  :spec,
]