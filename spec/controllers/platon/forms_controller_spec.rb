require 'spec_helper'

module Platon
  RSpec.describe FormsController, type: :controller do
    routes { Platon::Engine.routes }
    describe 'GET #show' do
      let(:params) {
        { data: {amount: 100.25, currency: 'UAH', description: 'Desc', name: 'rails way'}, id: 1, ext: [{reserve: 'UUID'}] }
      }
      it do
        get :show, params: params.merge(format: 'application/json')
        expect(assigns(:service)).to respond_to :form_prop
        expect(assigns(:service)).to respond_to :fields
      end
    end
  end

  RSpec.describe FormsController, type: :request do
    let(:params) {
      { data: {amount: 100.25, currency: 'UAH', description: 'Desc', name: 'rails way'}, id: 1, ext: [{reserve: 'UUID'}] }
    }
    
    describe 'GET #show as HTML' do
      it do
        get '/platon/forms', params: params.merge(format: :html)
        expect(response).to render_template(:show)
      end
    end
  end
end