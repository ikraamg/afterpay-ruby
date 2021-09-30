# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::API::Payment::Reversal do
  describe '#call' do
    let(:token) { "002.k03i883k6djrsig1geciam874agosfd799bdinloh1ge9jht" }

    context 'with token' do
      before(:each) do
        stub_request(:post, %r{global-api.afterpay.com/v2/payments/token:#{token}/reversal})
          .to_return(
            status: 204,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns status code 204' do
        expect(described_class.call(token: token).status).to eq(204)
      end
    end

    context 'with an invalid token' do
      let(:error_message) { 'Invalid Token' }
      let(:token) { '12' }
      let(:raw_response) do
        {
          errorCode: 'Invalid Token',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 402
        }.to_json
      end

      before(:each) do
        stub_request(:post, %r{global-api.afterpay.com/v2/payments/token:#{token}/reversal})
          .to_return(
            status: 402,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises PaymentRequiredError' do
        expect { described_class.call(token: token) }.to raise_error Afterpay::PaymentRequiredError
      end

      it 'returns proper error message' do
        expect { described_class.call(token: token) }.to raise_error error_message
      end
    end
  end
end
