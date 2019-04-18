module Lightning
  # Returns general information concerning the lightning node
  # including it's identity pubkey, alias, the chains it is connected
  # to, and information concerning the number of open+pending channels.
  #
  # @example Receive node info
  #   Lightning.get_info
  #
  # @return [Lnrpc::GetInfoResponse] the response
  def self.get_node_info
    stub.get_info(Lnrpc::GetInfoRequest.new)
  end
end
