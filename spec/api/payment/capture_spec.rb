require 'spec_helper'

describe Afterpay::API::Payment::Capture do
  describe '#call' do
    let(:token)   { 'some_token' }
    let(:payment) { build(:payment, token: token) }

    context 'with proper params' do
      let(:raw_response) { JSON.generate(id: '123') }

      before(:each) do
        stub_request(:post, /api.us.afterpay.com\/v1\/payments/)
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(payment: payment).body).to be_instance_of Hashie::Mash
      end

      it 'returns afterpay order id' do
        expect(described_class.call(payment: payment).body).to include(:id)
      end
    end

    context 'client not confirmed order' do
      let(:error_message) { 'Order has a wrong state' }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 422
        }.to_json
      end

      before(:each) do
        stub_request(:post, /api.us.afterpay.com\/v1\/payments/)
          .to_return(
            status: 422,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises UnprocessableEntityError' do
        expect { described_class.call(payment: payment) }.to raise_error Afterpay::UnprocessableEntityError
      end

      it 'returns proper error message' do
        expect { described_class.call(payment: payment) }.to raise_error error_message
      end
    end
  end
end
