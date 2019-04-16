module Lightning
  # Create and manage lightning network invoices
  class Invoice
    class << self
      # Attempts to add a new invoice to the invoice
      # database and returns a payment request.
      #
      # @option args [Integer] :amount (0)
      #   Amount in satoshis
      #
      # @option args [Integer] :expiry (3600)
      #   Payment request expiry time in seconds.
      #
      # @option args [String] :desc ('')
      #   An optional memo to attach along with the invoice.
      #   Used for record keeping purposes for the invoices creator,
      #   and will also be set in the description field of the encoded
      #   payment request if the description_hash field is not being used.
      #
      # @example Create a new invoice
      #   Lightning::Invoice.create(amount: 500, desc: '1x Cappuccino')
      #     #=> {:payment_request=>"lnbc5u1pwtdq...}
      #
      # @return [Lightning::Invoice]
      def create(**args)
        value = args[:amount]
        expiry = args[:expiry]
        memo = args[:desc]

        Lightning.stub.add_invoice(
          Lnrpc::Invoice.new(value: value, expiry: expiry, memo: memo)
        ).to_hash
      end
    end
  end
end
