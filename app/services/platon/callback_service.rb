module Platon
  class CallbackService
    class Error < Struct.new(:message)
      def success?
        false
      end
    end

    class << self
      def call(params)
        if params['sign'] == callback_signature(params).to_str
          Platon::Status.new(params['status'])
        else
          Error.new('Error: Invalid signature')
        end
      end

      private

      def callback_signature(params)
        Digest::MD5.hexdigest([
                                  params['email'].to_s.reverse,
                                  Platon::Configure.cfg.account_password,
                                  params['order'],
                                  (params['card'][0, 6] + params['card'][-4, 4]).reverse
                              ].map { |_| _.to_s.upcase }.join)
      end
    end
  end
end
