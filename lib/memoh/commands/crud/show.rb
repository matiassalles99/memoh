# frozen_string_literal: true

module Memoh
  module Commands
    module CRUD
      module Show
        extend ActiveSupport::Concern

        included do
          desc "details", "Display all the details of a memo by name"
          def details(memo_name = nil)
            memo = Models::SSHMemo.find_by(name: memo_name)

            if memo.nil?
              puts "There's no memo named \"#{memo_name}\" !".red
              exit
            end

            memo.attributes.each do |attribute, value|
              puts "#{attribute.humanize}: #{value}".send(memo.color)
            end
          end
        end
      end
    end
  end
end
