# frozen_string_literal: true

module Memoh
  module Commands
    module CRUD
      module Update # :nodoc:
        extend ActiveSupport::Concern

        included do
          desc "update", "Update a memo by name"
          def update(memo_name = nil)
            memo = Models::SSHMemo.find_by(name: memo_name)

            if memo.nil?
              puts "There's no memo named \"#{memo_name}\" !".red
              exit
            end

            ask "Skip any field you don't want to update by hitting [ENTER]. Now, press any key to continue...".yellow
            puts ""

            memo_attributes = {}

            Models::SSHMemo.questions_map.each do |question_info|
              attribute = ask question_info[:question]
              memo_attributes[question_info[:attribute]] = attribute unless attribute.blank?
            end

            memo.assign_attributes(memo_attributes)

            if memo.valid?
              memo.update
              puts "Memo updated successfully!".green
            else
              puts "It looks like the memo's data is invalid:".red
              puts memo.errors.full_messages.join(", ").red
            end
          end
        end
      end
    end
  end
end
