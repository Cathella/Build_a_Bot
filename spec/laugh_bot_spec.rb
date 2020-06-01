require_relative '../lib/laughter.rb'

RSpec.describe Laugh do
  describe '#make_joke_request' do
    let(:request) { Laugh.new }
    let(:request_json) { request.make_joke_request }

    it 'should return hash response when the request is sucessful' do
      expect(request_json.class).to eql(Hash)
    end
    it 'returns an array response should not be empty' do
      expect(request_json.length).not_to eql(0)
    end
  end
end
