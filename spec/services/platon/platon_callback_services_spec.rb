require 'spec_helper'

module Platon
  RSpec.describe CallbackService do
    let(:params) {
      {
          email: 'example@email.org',
          card: '0000 0000 0000 0001',
          sign: 'd29a496b14206feb20d5c8382b23b356'
      }
    }
    before do
      Platon::Configure.cfg.account_password = 'R5JGxRTu2Q4nTDJeVnn9DJ7M'
    end

    describe '.success?' do
      subject { described_class.call(params.merge(status: 'accepted').as_json) }
      it { expect(subject.success?).to be_truthy }
    end

    describe '.failed?' do
      subject { described_class.call(params.merge(status: 'refund').as_json) }
      it { expect(subject.success?).to be_falsey }
    end

    describe 'signature' do
      context 'when valid' do
        subject { described_class.call(params.merge(status: 'accepted').as_json) }
        it {
          expect(subject).to be_a(Status)
        }
      end

      context 'when invalid' do
        subject { described_class.call(params.merge(status: 'accepted', sign: '-').as_json) }
        it {
          expect(subject).to be_a(CallbackService::Error)
          expect(subject.message).to eq('Error: Invalid signature')
        }
      end
    end
  end
end
