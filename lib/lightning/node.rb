module Lightning
  # Class for managing invoice functions like add, list, lookup and subscribe.
  class Node
    class << self
      # Returns general information concerning the lightning node
      # including it's identity pubkey, alias, the chains it is connected
      # to, and information concerning the number of open+pending channels.
      # @return [Hash] Response from your LND node
      def info
        Lightning.stub.get_info(Lnrpc::GetInfoRequest.new).to_hash
      end
    end
  end
end
