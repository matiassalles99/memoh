# frozen_string_literal: true

module Memoh
  module Commands
    module Connection
      module Health # :nodoc:
        extend ActiveSupport::Concern

        included do
          desc "health", "Checks the health of each SSH memo"
          def health
            memos = Models::SSHMemo.all
            invalid_memos = memos.reject(&:valid?)

            if invalid_memos.empty?
              puts "All memos are healthy!".green
            else
              puts "Oh oh :( It looks like the following memos have some issues:\n".yellow

              invalid_memos.each do |memo|
                puts "#{memo.name}: #{memo.errors.full_messages.join(", ")}".send(memo.color)
              end
            end
          end
        end
      end
    end
  end
end
