module Platon
  class CallbacksController < ApplicationController

    def create
      service = CallbackService.call(params)
      if service.success?
        Platon::Callbacks.setup.success.call(params)
      else
        Platon::Callbacks.setup.failed.call(params)
      end
      head :ok
    end
  end
end