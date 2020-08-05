require 'spec_helper'

module Platon
  RSpec.describe Configure, type: :model do

    describe 'Set configuration' do
      context 'when user set configuration' do
        subject(:config) { described_class.cfg }

        it 'key account_key exists' do
          expect(config.account_key).not_to be_nil
        end

        it 'key account_password exists' do
          expect(config.account_password).not_to be_nil
        end

        it 'key pay_url exists' do
          expect(config.pay_url).not_to be_nil
        end

        it 'key callback_url exists' do
          expect(config.callback_url).not_to be_nil
        end

        it 'key error_url exists' do
          expect(config.error_url).not_to be_nil
        end

        it 'key payment_method exists' do
          expect(config.payment_method).not_to be_nil
        end
      end
    end
  end
end
