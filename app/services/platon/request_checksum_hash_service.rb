require 'digest'

module Platon
  class RequestChecksumHashService
    class << self
      def call(product_prop)
        cfg = Platon::Configure.cfg
        params = [
          cfg.account_key,
          cfg.payment_method,
          product_prop,
          cfg.callback_url,
          cfg.account_password
        ].map { |k| k.to_s.reverse.upcase }.join

        d = Digest::MD5.new
        d.hexdigest(params)
      end
    end
  end
end
