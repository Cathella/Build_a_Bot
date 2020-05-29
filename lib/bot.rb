require 'telegram_bot'
require_relative 'bad_code_day.rb'

class Bot
  def initialize
    token = '1188580696:AAEsv6FuEoGg2o7TrhutCKgDVVd770m-VZU'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name},\nDo you have a bad code day? This bot will keep you motivated.\nRun /start command -- To start the bot,\nRun /inspire command -- To be Inspired,\nRun /joke command -- To get a joke,\nRun /stop command -- To end the bot.\n")
      when '/inspire'
        values = Inspire.new
        value = values.select_random
        bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)
      when '/joke'
        values = Joke.new
        value = values.make_the_request
        bot.api.send_message(chat_id: message.chat.id, text: "#{value['joke']}", date: message.date)
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Happy Coding!", date: message.date)
      else
        bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start, /stop, /inspire or /joke")
      end
    end
  end
  end
end
