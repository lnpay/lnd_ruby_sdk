# Namespace for classes and modules that handle communication with your LND node
module Lightning
  class << self
    # Add a new invoice, expressing intent for a future payment.
    # Invoices without an amount can be created by not supplying any
    # parameters or providing an amount of 0. These invoices allow the payee
    # to specify the amount of satoshis they wish to send.
    #
    # @option args [Integer] :amt (0)
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
    #   Lightning.addinvoice(amt: 500, memo: '1x Cappuccino')
    #
    # @return [Lnrpc::AddInvoiceResponse] response
    def addinvoice(**args)
      amt = args[:amt]
      expiry = args[:expiry]
      memo = args[:memo]

      stub.add_invoice(
        Lnrpc::Invoice.new(value: amt, expiry: expiry, memo: memo)
      )
    end

    # This command enables the retrieval of all invoices currently stored
    # within the database. It has full support for paginationed responses,
    # allowing users to query for specific invoices through their add_index.
    # This can be done by using either the first_index_offset or
    # last_index_offset fields included in the response as the index_offset of
    # the next request. The reversed flag is set by default in order to
    # paginate backwards. If you wish to paginate forwards, you must
    # explicitly set the flag to false. If none of the parameters are
    # specified, then the last 100 invoices will be returned.
    # For example: if you have 200 invoices, "listinvoices" will return
    # the last 100 created. If you wish to retrieve the previous 100, the
    # first_offset_index of the response can be used as the index_offset of
    # the next listinvoices request.
    #
    # @example List all invoices
    #   Lightning.listinvoices
    #
    # @return [Lnrpc::ListInvoiceResponse] response
    def listinvoices(**args)
      num_max_invoices = args[:num_max_invoices]
      index_offset = args[:index_offset]
      pending_only = args[:pending_only]
      reversed = args[:reversed]

      stub.list_invoices(
        Lnrpc::ListInvoiceRequest.new(
          num_max_invoices: num_max_invoices, index_offset: index_offset,
          pending_only: pending_only, reversed: reversed
        )
      )
    end
  end
end