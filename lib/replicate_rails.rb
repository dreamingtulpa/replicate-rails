# frozen_string_literal: true

require "replicate"
require "replicate_rails/version"
require "replicate_rails/engine" if defined?(Rails)

require "replicate_rails/configuration"

module ReplicateRails
  class Error < StandardError; end
  class WebhookError < Error; end

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end
  end
end
