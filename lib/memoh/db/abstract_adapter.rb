# frozen_string_literal: true

require "json"

module Memoh
  module DB
    class AbstractAdapter # :nodoc:
      def all
        raise NotImplementedError
      end

      def find_by(attributes)
        all.find do |obj|
          attributes.all? { |key, value| obj.send(key) == value }
        end
      end

      def create(obj)
        raise NotImplementedError
      end

      def update(obj)
        raise NotImplementedError
      end

      def delete(obj)
        raise NotImplementedError
      end
    end
  end
end
