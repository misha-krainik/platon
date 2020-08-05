require 'spec_helper'

module Platon
  Callbacks.setup.error =->(params) { params[:any] == 'any' }

  RSpec.describe ErrorsController, type: :controller do
    routes { Platon::Engine.routes }

    describe 'GET show' do
      it do
        get :show, params: { any: :any }
        expect(response).to have_http_status(200)
      end
    end
  end
end