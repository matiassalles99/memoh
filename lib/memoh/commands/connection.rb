# frozen_string_literal: true

require "active_support/concern"

require_relative "connection/connect"
require_relative "connection/health"

module Memoh
  module Commands
    module Connection # :nodoc:
      extend ActiveSupport::Concern

      included do
        include Connect
        include Health
      end
    end
  end
end
