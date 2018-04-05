class HomeController < ApplicationController
  def index
    #@concursos = Concurso.all
    #@eventos = current_user.eventos.all
    #@eventos = current_user.eventos.order('created_at desc')
  end

  def convert
    puts 'Ejecutando conversion de voces.'
    cc = VoiceConversionManagement.new
    cc.voice_conversion
    puts 'Terminando conversion de voces.'

  end

end
