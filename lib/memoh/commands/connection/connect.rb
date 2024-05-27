# frozen_string_literal: true

module Memoh
  module Commands
    module Connection
      module Connect # :nodoc:
        extend ActiveSupport::Concern

        included do
          desc "connect", "Connect to host using SSH by memo name. Example: memoh connect my_server"
          def connect(memo_name = nil)
            memo = Models::SSHMemo.find_by(name: memo_name)

            if memo.nil?
              puts "There's no memo named \"#{memo_name}\" !".red
              exit
            end

            puts "Connecting to #{memo_name}...".send(memo.color)
            exec memo.connection_string
          end
        end
      end
    end
  end
end
