require_relative '../lib/bad_code_day.rb'
require_relative '../lib/laughter.rb'

RSpec.describe Inspire do
  describe '#make_the_request' do
    let(:request) { Inspire.new }
    let(:request_json) { request.make_the_request }

    it 'should return json response when the request is sucessful' do
      expect(request_json.class).to eql(Array)
    end

    it 'returns an array response should not be empty' do
      expect(request_json.length).not_to eql(0)
    end
  end

  describe '#select_random' do
    let(:random) { Inspire.new }
    let(:request_random) { random.select_random }

    it 'should return an Hash' do
      expect(request_random.class).to eql(Hash)
    end

    it 'should return a key and a value' do
      expect(request_random.length).to eql(2)
    end
  end
end

RSpec.describe Laugh do
  describe '#make_the_request' do
    let(:request) { Laugh.new }
    let(:request_json) { request.make_the_request }
    it 'should return hash response when the request is sucessful' do
      expect(request_json.class).to eql(Hash)
    end
    it 'returns an array response should not be empty' do
      expect(request_json.length).not_to eql(0)
    end
  end
end
