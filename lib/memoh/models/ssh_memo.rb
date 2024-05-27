# frozen_string_literal: true

require "active_model"
require "colorize"
require_relative "concerns/persistence"

module Memoh
  module Models
    class SSHMemo # :nodoc:
      ALLOWED_COLORS = String.colors.map(&:to_s) - %w[black default]

      include ActiveModel::Model
      include ActiveModel::Attributes
      include ActiveModel::Dirty
      include ActiveModel::Serializers::JSON
      include ActiveModel::Validations::Callbacks
      include Concerns::Persistence

      attribute :name, :string
      attribute :username, :string
      attribute :host, :string
      attribute :identity_file, :string
      attribute :color, :string, default: "white"

      identifier_field :name

      validates :name, :host, :username, :identity_file, :color, presence: true

      validates :color, inclusion: { in: ALLOWED_COLORS }
      validate :identity_file_existence

      before_validation :expand_identity_file_path

      class << self
        # rubocop:disable Metrics/LineLength
        def questions_map
          [
            { attribute: :host, question: "Enter the IP address or hostname:" },
            { attribute: :username, question: "Enter the username:" },
            { attribute: :identity_file, question: "Enter the path to the SSH key used for this host:" },
            { attribute: :name, question: "Choose a name for your SSH memo (you'll use this name to connect to your host):" },
            { attribute: :color, question: "Choose a color for your SSH memo:\n(#{ALLOWED_COLORS.map { |color| color.send(color) }.join("/")})" }
          ]
        end
        # rubocop:enable Metrics/LineLength
      end

      def display_details
        "Name: #{name}, Host: #{host}".send(color)
      end

      def connection_string
        "ssh #{username}@#{host} -i #{identity_file}"
      end

      private

      def expand_identity_file_path
        return if identity_file.nil?

        self.identity_file = File.expand_path(identity_file)
      end

      def identity_file_existence
        return if File.exist?(identity_file)

        errors.add(:identity_file, "does not exist")
      end
    end
  end
end
