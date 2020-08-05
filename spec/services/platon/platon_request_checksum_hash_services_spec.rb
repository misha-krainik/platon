require 'spec_helper'

module Platon
  RSpec.describe RequestChecksumHashService do
    let(:product_prop) do
      {
          amount: '99.99',
          currency: 'USD',
          description: 'Desc',
      }
    end

    before do
      Platon::Configure.cfg.account_key = 'OSNK298HD'
      Platon::Configure.cfg.callback_url ='http://localhost:3000/platon/callback'
      Platon::Configure.cfg.account_password = '3pVzbpKpRHxbgAQfKqSEznNj'
    end

    it do
      expect(described_class.call(product_prop)).to eq 'bfff5e71fce192d77304980f8eadcc9c'
    end
  end
end
