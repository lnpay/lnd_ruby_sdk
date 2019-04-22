# Namespace for classes and modules that handle communication with your LND node
module Lightning
  class << self
    # Closedchannels returns a description of all the closed channels
    # that this node was a participant in.
    #
    # @option args [Boolean] :cooperative (false)
    # @option args [Boolean] :local_force (false)
    # @option args [Boolean] :remote_force (false)
    # @option args [Boolean] :breach (false)
    # @option args [Boolean] :funding_canceled (false)
    # @option args [Boolean] :abandoned (false)
    #
    # @example Receive a list of closed channels
    #   Lightning.closedchannels
    #
    # @return [Lnrpc::ClosedChannelsResponse]
    # @since 0.1.1
    def closedchannels(**args)
      stub.closed_channels(
        Lnrpc::ClosedChannelsRequest.new(
          cooperative: args[:cooperative], local_force: args[:local_force],
          remote_force: args[:remote_force], breach: args[:breach],
          funding_canceled: args[:funding_canceled], abandoned: args[:abandoned]
        )
      )
    end

    # Getchaninfo returns the latest authenticated network announcement for the
    # given channel identified by its channel ID: an 8-byte integer which
    # uniquely identifies the location of transaction's funding output within
    # the blockchain.
    #
    # @param [Integer] chan_id
    #
    # @example Get info from a channel ID
    #   Lightning.getchaninfo(629383545657950209)
    #
    # @return [Lnrpc::ChannelEdge]
    # @since 0.1.1
    def getchaninfo(chan_id)
      stub.get_chan_info(
        Lnrpc::ChanInfoRequest.new(
          chan_id: chan_id
        )
      )
    end

    # Listchannels returns a description of all the open channels
    # that this node is a participant in.
    #
    # @example Receive a list of open channels
    #   Lightning.listchannels
    #
    # @option args [Boolean] :active_only (false)
    # @option args [Boolean] :inactive_only (false)
    # @option args [Boolean] :public_only (false)
    # @option args [Boolean] :private_only (false)
    #
    # @return [Lnrpc::ListChannelsResponse]
    # @since 0.1.1
    def listchannels(**args)
      stub.list_channels(
        Lnrpc::ListChannelsRequest.new(
          active_only: args[:active_only], inactive_only: args[:inactive_only],
          public_only: args[:public_only], private_only: args[:private_only]
        )
      )
    end

    # Pendingchannels returns a list of all the channels that are currently
    # considered "pending". A channel is pending if it has finished the funding
    # workflow and is waiting for confirmations for the funding txn, or is in
    # the process of closure, either initiated cooperatively or non-
    # cooperatively.
    #
    # @example Receive a list of pending channels
    #   Lightning.pendingchannels
    #
    # @return [Lnrpc::PendingChannelsResponse]
    # @since 0.1.1
    def pendingchannels
      stub.pending_channels(
        Lnrpc::PendingChannelsRequest.new
      )
    end
  end
end
