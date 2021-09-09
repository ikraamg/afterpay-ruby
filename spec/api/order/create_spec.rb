# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::API::Order::Create do
  describe '#call' do
    let(:order) { build(:order) }

    context 'with proper params' do
      let(:token)        { 'some_token' }
      let(:expires)      { Time.now }
      let(:raw_response) { JSON.generate(token: token, expires: expires) }

      before(:each) do
        stub_request(:post, %r{global-api.afterpay.com/v2/checkouts})
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(order: order).body).to be_instance_of Hashie::Mash
      end

      it 'returns token and expires' do
        expect(described_class.call(order: order).body).to include(:token, :expires)
      end
    end

    context 'with missing params' do
      let(:error_message) { 'Total amount is missing' }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 422
        }.to_json
      end

      before(:each) do
        stub_request(:post, %r{global-api.afterpay.com/v2/checkouts})
          .to_return(
            status: 422,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
        allow(order).to receive(:as_json).and_return(double(Hash))
      end

      it 'raises UnprocessableEntityError' do
        expect { described_class.call(order: order) }.to raise_error Afterpay::UnprocessableEntityError
      end

      it 'returns proper error message' do
        expect { described_class.call(order: order) }.to raise_error error_message
      end
    end
  end
end
