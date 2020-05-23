require 'telegram_bot'
token = '1188580696:AAEsv6FuEoGg2o7TrhutCKgDVVd770m-VZU'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Select a service by running a command\nRun /send command -- To send money\nRun /airtime command -- To buy airtime\nRun /data command -- To buy Internet\nRun /balance command -- To check balance"
    when /send/i
      reply.text = 'Enter number to send to'
    when /airtime/i
      reply.text = 'Enter number to load to'
    when /data/i
      reply.text = 'Enter number to load to'
    when /balance/i
      reply.text = 'Enter your number'
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
