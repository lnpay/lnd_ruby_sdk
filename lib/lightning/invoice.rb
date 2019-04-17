module Lightning
  # Create and manage lightning network invoices
  class Invoice
    class << self
      # Attempts to add a new invoice to the invoice
      # database and returns a payment request.
      #
      # @option args [Integer] :value (0)
      #   Amount in satoshis
      #
      # @option args [Integer] :expiry (3600)
      #   Payment request expiry time in seconds.
      #
      # @option args [String] :memo ('')
      #   An optional memo to attach along with the invoice.
      #   Used for record keeping purposes for the invoices creator,
      #   and will also be set in the description field of the encoded
      #   payment request if the description_hash field is not being used.
      #
      # @example Create a new invoice
      #   Lightning::Invoice.create(value: 500, memo: '1x Cappuccino')
      #
      # @return [Hash] response
      def create(**args)
        value = args[:value]
        expiry = args[:expiry]
        memo = args[:memo]

        Lightning.stub.add_invoice(
          Lnrpc::Invoice.new(value: value, expiry: expiry, memo: memo)
        ).to_hash
      end

      # Returns a list of all the invoices currently stored within
      # the database. Any active debug invoices are ignored. It has full support
      # for paginated responses, allowing users to query for specific invoices
      # through their add_index. This can be done by using either the
      # first_index_offset or last_index_offset fields included in the response
      # as the index_offset of the next request. By default, the first 100
      # invoices created will be returned. Backwards pagination is also
      # supported through the Reversed flag.
      #
      # @example List all invoices
      #   Lightning::Invoice.list
      #
      # @return [Hash] response
      def list(**args)
        num_max_invoices = args[:num_max_invoices]
        index_offset = args[:index_offset]
        pending_only = args[:pending_only]
        reversed = args[:reversed]

        Lightning.stub.list_invoices(
          Lnrpc::ListInvoiceRequest.new(
            num_max_invoices: num_max_invoices, index_offset: index_offset,
            pending_only: pending_only, reversed: reversed
          )
        ).to_hash
      end
    end
  end
end
