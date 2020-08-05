module Platon
  class FormsController < ApplicationController
    def show
      @service = FormService.call(form_params[:data], order: form_params[:id])
    end

    private def form_params
      params.permit(:id,
          data: [:amount, :currency, :description, :selected, :recurring],
          ext: [:name, :value]
      )
    end
  end
end
