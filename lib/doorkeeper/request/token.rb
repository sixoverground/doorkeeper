require 'doorkeeper/request/strategy'

module Doorkeeper
  module Request
    class Token < Strategy
      delegate :current_resource_owner, to: :server

      def pre_auth
        puts "token strategy pre auth"
        server.context.send(:pre_auth)
      end

      def request
        puts "get token request"
        @request ||= OAuth::TokenRequest.new(pre_auth, current_resource_owner)
      end
    end
  end
end
