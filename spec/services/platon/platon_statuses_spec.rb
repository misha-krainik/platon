require 'spec_helper'

module Platon
  RSpec.describe Status do
    describe '#failed?' do
      subject { described_class.new('sale') }
      it { is_expected.to be_success }
    end

    describe '#success?' do
      subject { described_class.new('chargeback') }
      it { is_expected.to be_failed }
    end
  end
end
