require 'spec_helper'

describe Afterpay::API::Payment::Refund do
  describe '#call' do
    let(:order_id) { '123' }

    context 'with proper params' do
      let(:amount)       { build(:money) }
      let(:refund)       { build(:refund, amount: amount)}
      let(:refund_id)    { '321' }
      let(:raw_response) { JSON.generate(refundId: refund_id) }

      before(:each) do
        stub_request(:post, /api.us.afterpay.com\/v1\/payments\/123\/refund/)
          .to_return(
            status: 201,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'returns hashie mash' do
        expect(described_class.call(order_id: order_id, refund: refund).body).to be_instance_of Hashie::Mash
      end

      it 'returns token and expires' do
        expect(described_class.call(order_id: order_id, refund: refund).body).to include(:refundId)
      end
    end

    context 'with wrong params' do
      let(:error_message) { 'Amount is greater than order amount' }
      let(:amount)        { Afterpay::Components::Money.new(amount: '250.00', currency: 'USD') }
      let(:refund)        { Afterpay::Components::Refund.new(amount: amount) }
      let(:raw_response) do
        {
          errorCode: 'invalid',
          errorId: '5393ff621317c438',
          message: error_message,
          httpStatusCode: 422
        }.to_json
      end

      before(:each) do
        stub_request(:post, /api.us.afterpay.com\/v1\/payments\/123\/refund/)
          .to_return(
            status: 422,
            body: raw_response,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      it 'raises UnprocessableEntityError' do
        expect { described_class.call(order_id: order_id, refund: refund) }.to raise_error Afterpay::UnprocessableEntityError
      end

      it 'returns proper error message' do
        expect { described_class.call(order_id: order_id, refund: refund) }.to raise_error error_message
      end
    end
  end
end
