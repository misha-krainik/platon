module Platon
  class Configure < Struct.new(:account_key, :account_password, :pay_url, :callback_url, :error_url, :payment_method)
    def self.cfg
      @@cfg ||= Configure.new
      if block_given?
        yield @@cfg
      end
      @@cfg
    end
  end
end
