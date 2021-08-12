# frozen_string_literal: true

require 'spec_helper'

describe Afterpay::ErrorHandler do
  describe '.inspect' do
    let(:response)      { Object.new }
    let(:error_body)    { "{\"error\":\"fail\"}" }
    let(:error_message) { 'failed request' }

    it 'returns a response if status is 200' do
      allow(response).to receive(:ok?)  { true }
      allow(response).to receive(:status) { 200 }

      expect(described_class.inspect(response)).to eq response
    end

    context 'errored response' do
      before(:each) do
        allow(response).to   receive(:ok?)     { false }
        allow(response).to   receive(:body)    { error_body }
        allow(response).to   receive(:message) { error_message }
      end

      it 'raises an error if status is not 200 and code is matched' do
        allow(response).to   receive(:status)  { 400 }

        expect { described_class.inspect(response) }.to raise_error(Afterpay::BadRequestError)
      end

      it 'raises ServerError if code is not match' do
        allow(response).to   receive(:status) { 503 }

        expect { described_class.inspect(response) }.to raise_error(Afterpay::ServiceUnavailableError)
      end
    end
  end
end
