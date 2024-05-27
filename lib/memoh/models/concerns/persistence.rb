# frozen_string_literal: true

require "active_support/concern"
require_relative "../../db/json_adapter"

module Memoh
  module Models
    module Concerns
      module Persistence # :nodoc:
        extend ActiveSupport::Concern

        included do
          class_attribute :persistence_class, default: Memoh::DB::JSONAdapter
          class_attribute :id_field, default: :name
        end

        module ClassMethods # :nodoc:
          def all
            persistence_manager.all
          end

          def find_by(attributes)
            persistence_manager.find_by(attributes)
          end

          def persistence_manager
            persistence_class.new(self)
          end

          def identifier_field(field)
            self.id_field = field
          end
        end

        def save
          self.class.persistence_manager.create(self)
        end

        def update
          self.class.persistence_manager.update(self)
        end

        def delete
          self.class.persistence_manager.delete(self)
        end
      end
    end
  end
end
