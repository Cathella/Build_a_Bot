# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
require 'telegram_bot'
require 'dotenv/load'
require_relative 'bad_code_day.rb'
require_relative 'laughter.rb'

class Bot
  def initialize
    token = ENV['TOKEN']

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name},\nDo you have a bad code day? I mean those days when you feel you have not accomplished anything. This bot will keep you motivated.\nRun /start command -- To start the bot,\nRun /inspire command -- To be Inspired,\nRun /laugh command -- To smile,\nRun /stop command -- To end the bot.\n")
        when '/inspire'
          values = Inspire.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)
        when '/laugh'
          values = Laugh.new
          value = values.make_joke_request
          bot.api.send_message(chat_id: message.chat.id, text: "#{value['joke']}", date: message.date)
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: 'Happy Coding :)', date: message.date)
        else
          bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you, #{message.from.first_name}, Use  /start, /stop, /inspire or /laugh commands")
        end
      end
    end
  end
end
# rubocop: enable Metrics/MethodLength
# rubocop: enable Layout/LineLength
