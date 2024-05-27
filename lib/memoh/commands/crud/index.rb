# frozen_string_literal: true

module Memoh
  module Commands
    module CRUD
      module Index # :nodoc:
        extend ActiveSupport::Concern

        included do
          desc "list", "List all SSH memos"
          def list
            memos = Models::SSHMemo.all

            memos.each do |memo|
              puts memo.display_details
            end
          end
        end
      end
    end
  end
end
