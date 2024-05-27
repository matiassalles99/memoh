# frozen_string_literal: true

require "active_support/concern"

require_relative "crud/index"
require_relative "crud/show"
require_relative "crud/create"
require_relative "crud/update"
require_relative "crud/delete"

module Memoh
  module Commands
    module CRUD # :nodoc:
      extend ActiveSupport::Concern

      included do
        include Index
        include Show
        include Create
        include Update
        include Delete
      end
    end
  end
end
