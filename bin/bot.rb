require 'telegram_bot'
token = '1188580696:AAEsv6FuEoGg2o7TrhutCKgDVVd770m-VZU'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Hello #{message.from.first_name} \nI am your comforter through a bad code day. The aim of the bot is to keep you inspired and motivated at all times. \nRun /inspire command -- To get Motivation Quotes\nRun /music command -- To play Motivation song\n"
    when /inspire/i
      quotes = ['Keep Strong', 'Keep Calm', 'Keep Moving']
      reply.text = "#{quotes.sample.capitalize}."
    when /music/i
      reply.text = 'Your winning song'
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
