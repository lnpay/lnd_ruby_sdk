module Lightning
  class Node
    class << self
      include Lightning::Stub
      # Returns general information concerning the lightning node
      # including it's identity pubkey, alias, the chains it is connected
      # to, and information concerning the number of open+pending channels.
      #
      # @example Receive node info
      #   Lightning::Node.info #=> {:identity_pubkey=>... }
      #
      # @return [Lnrpc::GetInfoResponse] the response
      def info
        return_res stub.get_info(Lnrpc::GetInfoRequest.new)
      end
    end
  end
end
