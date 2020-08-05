require 'spec_helper'

module Platon
  RSpec.describe Encrypt do
    let(:data) do
      {
          amount: '99.99',
          currency: 'USD',
          description: 'Desc',
      }
    end

    let(:result) { 'eyJhbW91bnQiOiI5OS45OSIsImN1cnJlbmN5IjoiVVNEIiwiZGVzY3JpcHRpb24iOiJEZXNjIn0=' }

    it do
      expect(described_class.code(data)).to eq result
    end
  end
end
