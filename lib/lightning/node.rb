module Lightning
  # Class for managing invoice functions like add, list, lookup and subscribe.
  class Node
    class << self
      # Returns general information concerning the lightning node
      # including it's identity pubkey, alias, the chains it is connected
      # to, and information concerning the number of open+pending channels.
      #
      # @example Receive node info
      #   Lightning::Node.info #=> {:identity_pubkey=>... }
      #
      # @return [Hash] the response
      def info
        Lightning.stub.get_info(Lnrpc::GetInfoRequest.new).to_hash
      end
    end
  end
end
