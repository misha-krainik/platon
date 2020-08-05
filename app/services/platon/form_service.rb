require 'base64'

module Platon
  class FormService < Struct.new(:form_prop, :fields)
    class << self
      def call(data, order:, extra_fields: nil)
        form_prop = { method: :POST, url: cfg.pay_url }

        encrypted_data = Platon::Encrypt.code(data)
        sign = Platon::RequestChecksumHashService.call(encrypted_data)

        fields = [{ type: 'hidden', name: 'key', value: cfg.account_key },
                  { type: 'hidden', name: 'payment', value: cfg.payment_method },
                  { type: 'hidden', name: 'url', value: cfg.callback_url },
                  { type: 'hidden', name: 'order', value: order },
                  { type: 'hidden', name: 'data', value: encrypted_data },
                  { type: 'hidden', name: 'sign', value: sign }]

        if extra_fields.is_a? Hash
          fields.push extract_extra_fields(extra_fields, keys_skip: fields.map { |i| i[:name] })
        end

        new(form_prop, fields)
      end

      private

      def extract_extra_fields(extra_fields, keys_skip: [])
        extra_fields[:ext].map do |ext|
          skip if keys_skip.include? ext[:name]
          {type: 'hidden', name: ext[:name], value: ext[:value]}
        end
      end

      def cfg
        cfg = Platon::Configure.cfg
        raise ArgumentError, "Can't find Platon credentials" if cfg.account_key.nil?
        cfg
      end
    end
  end
end
