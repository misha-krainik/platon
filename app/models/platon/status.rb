module Platon
  class Status
    attr_accessor :order_status

    def initialize(order_status)
      @order_status = order_status.upcase
    end

    def failed?
      %w{CHARGEBACK REFUND}.include?(@order_status)
    end

    def success?
      %w{SALE ACCEPTED}.include?(@order_status)
    end
  end
end
