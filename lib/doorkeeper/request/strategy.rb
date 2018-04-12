module Doorkeeper
  module Request
    class Strategy
      attr_accessor :server

      delegate :authorize, to: :request

      def initialize(server)
        puts "init doorkeeper strategy"
        self.server = server
      end

      def request
        raise NotImplementedError, "request strategies must define #request"
      end
    end
  end
end
