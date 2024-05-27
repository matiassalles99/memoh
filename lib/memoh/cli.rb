# frozen_string_literal: true
require "thor"
require "colorize"
require "active_support/core_ext/object/blank"

require_relative "models/ssh_memo"
require_relative "commands/crud"
require_relative "commands/connection"

module Memoh
  class CLI < Thor # :nodoc:
    include Thor::Actions

    include Commands::CRUD
    include Commands::Connection

    desc "version", "Display Memoh version"
    map %w[-v --version] => :version
    def version
      puts Memoh::VERSION
    end
  end
end
