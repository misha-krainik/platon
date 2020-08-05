require 'spec_helper'

module Platon
  RSpec.describe CallbacksController, type: :controller do
    routes { Platon::Engine.routes }

    let(:params) {
      {
          email: 'example@email.org',
          card: '0000 0000 0000 0001',
          sign: '60be9c95f46e5707a580a50ac141fc0d'
      }
    }
    describe 'GET show #success' do
      before { Callbacks.setup.success =->(params) { expect(params[:status]).to eq 'accepted'} }
      it do
        post :create, params: params.merge({ status: 'accepted'})
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET show #failed' do
      before { Callbacks.setup.failed =->(params) { expect(params[:status]).to eq 'refund'} }
      it do
        post :create, params: params.merge({ status: 'refund'})
        expect(response).to have_http_status(200)
      end
    end
  end
end