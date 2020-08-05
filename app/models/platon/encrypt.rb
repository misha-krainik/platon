module Platon
  class Encrypt
    class << self
      def code(data)
        Base64.strict_encode64(
            ActiveSupport::JSON.encode(
                Hash(data)
            )
        )
      end
    end
  end
end
