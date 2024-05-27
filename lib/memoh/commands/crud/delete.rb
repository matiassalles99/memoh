# frozen_string_literal: true

module Memoh
  module Commands
    module CRUD
      module Delete # :nodoc:
        extend ActiveSupport::Concern

        included do
          desc "delete", "Delete a memo by name"
          def delete(memo_name = nil)
            memo = Models::SSHMemo.find_by(name: memo_name)

            if memo.nil?
              puts "There's no memo named \"#{memo_name}\" !".red
              exit
            end

            confirmation = ask "Are you sure you want to delete #{memo_name}? (y/n)"

            if confirmation.downcase == "y"
              memo.delete
              puts "Memo #{memo.name} deleted successfully".green
            else
              puts "Memo deletion cancelled.".yellow
            end
          end
        end
      end
    end
  end
end
