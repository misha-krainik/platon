module Platon
  class ErrorsController < ApplicationController

    def show
      Platon::Callbacks.setup.error.call(params)
      head :ok
    end
  end
end