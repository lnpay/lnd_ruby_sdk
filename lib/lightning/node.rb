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
    def getinfo
      stub.get_info(Lnrpc::GetInfoRequest.new)
    end
  end
end
