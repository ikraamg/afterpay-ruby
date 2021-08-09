require 'spec_helper'

describe Afterpay::Components::Base do
  describe '#to_json' do
    context 'with instance variables' do
      let(:expected) { { 'foo' => 'bar' } }
      before(:each)  { subject.instance_variables_set(:foo, 'bar') }

      it 'returns valid json' do
        expect(subject.to_json).to eq expected
      end
    end
  end
end
