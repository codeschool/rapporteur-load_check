require "rubygems"
require "bundler/setup"
require "combustion"

ENV["RAILS_ENV"] ||= "test"
Combustion.initialize!(:action_controller, :active_record)

require "rspec/rails"
require "rapporteur/rspec"
require "rapporteur/load_check"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = "random"

  config.before { Rapporteur.clear_checks }
end
