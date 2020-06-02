require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Laugh
  @values = nil

  def initialize
    @values = @make_joke_request
  end

  def make_joke_request
    url = 'https://api.yomomma.info'
    address = URI.escape(url)
    uri = URI.parse(address)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
