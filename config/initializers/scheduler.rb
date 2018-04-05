#require 'rufus-scheduler'

#scheduler = Rufus::Scheduler.new

#Thread.new do
#  puts 'Inicio de llamado al scheduler'
#  scheduler = Rufus::Scheduler::singleton

#  scheduler.cron '*/1 * * * *' do
#    puts 'Ejecutando conversion de voces.'
#    cc = VoiceConversionManagement.new
#    cc.voice_conversion
#    puts 'Terminando conversion de voces.'
#  end

#  scheduler.join
#end