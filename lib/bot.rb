require 'telegram_bot'
require_relative 'bad_code_day.rb'

token = '1188580696:AAEsv6FuEoGg2o7TrhutCKgDVVd770m-VZU'
bot = TelegramBot.new(token: token)

class Bot
  def initialize
    token = '1188580696:AAEsv6FuEoGg2o7TrhutCKgDVVd770m-VZU'

    bot.get_updates(fail_silently: true) do |message|
      command = message.get_command_for(bot)

      message.reply do |reply|
        case command
        when /start/i
          reply.text = "Hello #{message.from.first_name} \nI am your comforter through a bad code day. The aim of the bot is to keep you inspired and motivated at all times. \nRun /inspire command -- To get Motivation Quotes\nRun /music command -- To play Motivation song\n"
        when /inspire/i
          values = Inspire.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)

          # quotes = [
          #   'Do not compare yourself with anyone. You and the rest are so different, that when you realize it, a comparison will not even be possible',
          #   'Do not take things personally, do not take it personally. Then you win.',
          #   'Do not find reasons to be unhappy. It does not pay to be sad. It pays to be joyous.',
          #   'Do not underestimate the power of people. Network.'
          # ]
          # reply.text = "#{quotes.sample}."
        when /music/i
          reply.text = 'Your winning song'
        else
          reply.text = "I have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end
end
