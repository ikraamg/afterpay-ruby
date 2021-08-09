require 'spec_helper'

describe Afterpay::Components::Base do
  describe '#to_json' do
    context 'without instance variables' do
      it 'returns empty json' do
        expect(subject.to_json).to eq "{}"
      end
    end

    context 'with instance variables' do
      let(:expected) { "{\"foo\":\"bar\"}" }
      before(:each)  { subject.instance_variable_set(:@foo, 'bar') }

      it 'returns valid json representation of instance variables' do
        expect(subject.to_json).to eq expected
      end
    end

    context 'with instance variables and encapsulated object' do
      let(:expected) {
        "{\"foo\":\"bar\",\"testObject\":{\"test_variable\":\"test_value\"}}"
      }
      let(:test_object) { double('test_class', { test_variable: 'test_value' }) }

      before(:each) do
        subject.instance_variable_set(:@foo, 'bar')
        subject.instance_variable_set(:@test_object, test_object)
      end

      it 'returns valid json representation of instance variables and encapsulated object' do
        allow(test_object).to receive(:is_a?).with(Afterpay::Components::Base).and_return(true)
        allow(test_object).to receive(:to_json).and_return("{\"test_variable\":\"test_value\"}")
        allow(test_object).to receive(:as_json).and_return({"test_variable": "test_value"})

        expect(subject.to_json).to eq expected
      end
    end
  end
end
