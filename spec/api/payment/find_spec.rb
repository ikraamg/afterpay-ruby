# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::API::Payment::Find do
  describe '#call' do
    let(:order_id) { '12345' }

    context 'with proper params' do
      let(:raw_response) { JSON.generate(paymentState: 'VOIDED') }

      before(:each) do
        stub_request(:get, %r{global-api.afterpay.com/v2/payments/#{order_id}})
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(order_id: order_id).body).to be_instance_of Hashie::Mash
      end

      it 'returns afterpay paymentState' do
        expect(described_class.call(order_id: order_id).body).to include(:paymentState)
      end
    end

    context 'with an invalid order_id' do
      let(:error_message) { 'An error occurred' }
      let(:order_id) { '12' }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 404
        }.to_json
      end

      before(:each) do
        stub_request(:get, %r{global-api.afterpay.com/v2/payments/#{order_id}})
          .to_return(
            status: 404,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises NotFoundError' do
        expect { described_class.call(order_id: order_id) }.to raise_error Afterpay::NotFoundError
      end

      it 'returns proper error message' do
        expect { described_class.call(order_id: order_id) }.to raise_error error_message
      end
    end
  end
end
