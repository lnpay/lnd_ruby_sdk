# Namespace for classes and modules that handle communication with your LND node
module Lightning
  class << self
    # Returns general information concerning the lightning node
    # including it's identity pubkey, alias, the chains it is connected
    # to, and information concerning the number of open+pending channels.
    #
    # @example Receive node info
    #   Lightning.getinfo
    #
    # @return [Lnrpc::GetInfoResponse]
    # @since 0.1.0
    def getinfo
      stub.get_info(Lnrpc::GetInfoRequest.new)
    end

    # Getnetworkinfo returns some basic stats about the known channel
    # graph from the point of view of the node.
    #
    # @example Get network info
    #   Lightning.getnetworkinfo
    #
    # @return [Lnrpc::NetworkInfo]
    # @since 0.1.1
    def getnetworkinfo
      stub.get_network_info(
        Lnrpc::NetworkInfoRequest.new
      )
    end

    # Getnodeinfo returns the latest advertised, aggregated, and authenticated
    # channel information for the specified node identified by its public key.
    #
    # @param [String] The public key of the node you want get info from
    # @example Get node information from a pubkey
    #   Lightning.getnodeinfo("030c3...c14f")
    #
    # @return [Lnrpc::NodeInfo]
    # @since 0.1.1
    def getnodeinfo(pubkey)
      stub.get_node_info(
        Lnrpc::NodeInfoRequest.new(pub_key: pubkey)
      )
    end
  end
end
