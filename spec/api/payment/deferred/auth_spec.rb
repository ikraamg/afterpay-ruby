# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::API::Payment::Auth do
  describe '#call' do
    let(:token)   { 'some_token' }
    let(:payment) { build(:payment, token: token) }

    context 'with proper params' do
      let(:raw_response) { JSON.generate(status: "APPROVED", paymentState: "AUTH_APPROVED") }

      before(:each) do
        stub_request(:post, %r{global-api.afterpay.com/v2/payments/auth})
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(payment: payment).body).to be_instance_of Hashie::Mash
      end

      it 'returns afterpay payment status and paymentState' do
        expect(described_class.call(payment: payment).body).to include(:status, :paymentState)
      end
    end

    context 'with wrong order token' do
      let(:error_message) { 'Cannot complete payment, expired or invalid token.' }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 402
        }.to_json
      end

      before(:each) do
        stub_request(:post, %r{global-api.afterpay.com/v2/payments/auth})
          .to_return(
            status: 402,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises PaymentRequiredError' do
        expect { described_class.call(payment: payment) }.to raise_error Afterpay::PaymentRequiredError
      end

      it 'returns proper error message' do
        expect { described_class.call(payment: payment) }.to raise_error error_message
      end
    end

    context 'when receiving a timeout error' do
      before do
        request = instance_double(::Afterpay::HTTPService::Request)
        allow(request).to receive(:perform).and_raise(::Faraday::TimeoutError)
        allow(::Afterpay::HTTPService::Request).to receive(:new).and_return(request)
      end

      it 'raises RequestTimeoutError' do
        expect { described_class.call(payment: payment) }.to raise_error Afterpay::RequestTimeoutError
      end
    end
  end
end
