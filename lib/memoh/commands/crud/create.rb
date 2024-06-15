# frozen_string_literal: true

module Memoh
  module Commands
    module CRUD
      module Create # :nodoc:
        extend ActiveSupport::Concern

        included do
          desc "create", "Create a new SSH memo"
          def create
            memo_attributes = {}

            Models::SSHMemo.questions_map.each do |question_info|
              attribute = ask question_info[:question]
              memo_attributes[question_info[:attribute]] = attribute
            end

            memo = Models::SSHMemo.new(memo_attributes)

            if memo.valid?
              memo.save
              puts "Memo created successfully!".green
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
