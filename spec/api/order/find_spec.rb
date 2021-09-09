# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::API::Order::Find do
  describe '#call' do
    let(:token) { '12345' }

    context 'with proper params' do
      let(:raw_response) { JSON.generate(redirectCheckoutUrl: "https://portal.sandbox.afterpay.com/us/checkout/?token=#{token}") }

      before(:each) do
        stub_request(:get, %r{global-api.afterpay.com/v2/checkouts/#{token}})
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(token: token).body).to be_instance_of Hashie::Mash
      end

      it 'returns afterpay redirectCheckoutUrl' do
        expect(described_class.call(token: token).body).to include(:redirectCheckoutUrl)
      end
    end

    context 'with an invalid token' do
      let(:error_message) { 'Invalid token' }
      let(:raw_response) do
        {
          errorCode: 'Invalid token',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 412
        }.to_json
      end

      before(:each) do
        stub_request(:get, %r{global-api.afterpay.com/v2/checkouts/#{token}})
          .to_return(
            status: 412,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises PreconditionFailedError' do
        expect { described_class.call(token: token) }.to raise_error Afterpay::PreconditionFailedError
      end

      it 'returns proper error message' do
        expect { described_class.call(token: token) }.to raise_error error_message
      end
    end
  end
end
