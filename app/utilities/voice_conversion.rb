class VoiceConversion

  def self.conversion_To_MP3(original_File_Path, converted_File_Path)
    puts "origen: " + original_File_Path
    puts "Destino " + converted_File_Path
    #command = 'ffmpeg -i ' + original_File_Path + ' -y -c:v libx264 -c:a aac ' + converted_File_Path
    command = "ffmpeg -i '" + original_File_Path + "' '" + converted_File_Path + "'"
    IO.popen(command) { |f| puts f }
    puts command
  end

end
