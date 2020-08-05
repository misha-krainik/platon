module Platon
  class Callbacks < Struct.new(:success, :failed, :error)
    def self.setup
      @setup ||= Callbacks.new
    end
  end

  Callbacks.setup.success = ->(_) {}
  Callbacks.setup.failed = ->(_) {}
  Callbacks.setup.error = ->(_) {}
end