RSpec.configure do |config|
  require 'rails_helper'
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:all) do
    FactoryBot.reload
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
