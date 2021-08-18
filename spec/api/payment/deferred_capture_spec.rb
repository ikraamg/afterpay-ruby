# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::API::Payment::DeferredCapture do
  describe '#call' do
    let(:amount) { build(:money) }
    let(:order_id) { '12345' }
    let(:payment) { build(:payment, amount: amount) }

    context 'with proper params' do
      let(:raw_response) { JSON.generate(paymentState: 'PARTIALLY_CAPTURED') }

      before(:each) do
        stub_request(:post, %r{api.us.afterpay.com/v2/payments/#{order_id}/capture})
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(payment: payment, order_id: order_id).body).to be_instance_of Hashie::Mash
      end

      it 'returns afterpay order id' do
        expect(described_class.call(payment: payment, order_id: order_id).body).to include(:paymentState)
      end
    end

    context 'client not captured payment without Auth' do
      let(:error_message) { 'A valid auth was not performed for this payment id.' }
      let(:order_id) { '12' }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 412
        }.to_json
      end

      before(:each) do
        stub_request(:post, %r{api.us.afterpay.com/v2/payments/#{order_id}/capture})
          .to_return(
            status: 412,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises NotFoundError' do
        expect { described_class.call(payment: payment, order_id: order_id) }.to raise_error Afterpay::PreconditionFailedError
      end

      it 'returns proper error message' do
        expect { described_class.call(payment: payment, order_id: order_id) }.to raise_error error_message
      end
    end

    context 'when there is no order_id' do
      let(:error_message) { 'Afterpay payment ID not found.' }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 404
        }.to_json
      end

      before(:each) do
        stub_request(:post, %r{api.us.afterpay.com/v2/payments//capture})
          .to_return(
            status: 404,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises NotFoundError' do
        expect { described_class.call(payment: payment) }.to raise_error Afterpay::NotFoundError
      end

      it 'returns proper error message' do
        expect { described_class.call(payment: payment) }.to raise_error error_message
      end
    end
  end
end
