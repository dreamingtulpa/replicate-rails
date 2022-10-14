# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "mocha/minitest"
require "byebug"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
FIXTURES_DIR = File.join(File.dirname(__FILE__), 'fixtures')
