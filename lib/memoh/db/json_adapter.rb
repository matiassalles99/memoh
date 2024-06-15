# frozen_string_literal: true

require "json"

require_relative "abstract_adapter"

module Memoh
  module DB
    class JSONAdapter < AbstractAdapter # :nodoc:
      DIRECTORY = File.expand_path("~/.memoh")
      FILE_PATH = File.expand_path("#{DIRECTORY}/memoh_db.json")

      def initialize(persisted_class)
        @persisted_class = persisted_class
        Dir.mkdir(DIRECTORY) unless Dir.exist?(DIRECTORY)
      end

      def all
        @objects ||= begin
          retrieved_json = File.exist?(FILE_PATH) ? JSON.parse(File.read(FILE_PATH)) : []
          retrieved_json.map { |obj| @persisted_class.new.from_json(obj.to_json) }
        end
      end

      def create(obj)
        current_objs = all
        current_objs << obj

        File.open(FILE_PATH, "w") do |f|
          f.write(current_objs.to_json)
        end
      end

      def update(obj)
        current_objs = all
        index = current_objs.find_index do |memo|
          memo.send(@persisted_class.id_field) == memo.send("#{@persisted_class.id_field}_was")
        end
        current_objs[index] = obj

        File.open(FILE_PATH, "w") do |f|
          f.write(current_objs.to_json)
        end
      end

      def delete(obj)
        current_objs = all
        current_objs.reject! { |co| obj.send(@persisted_class.id_field) == co.send(@persisted_class.id_field) }

        File.open(FILE_PATH, "w") do |f|
          f.write(current_objs.to_json)
        end
      end
    end
  end
end
