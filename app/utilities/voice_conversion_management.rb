class VoiceConversionManagement
  require 'carrierwave/orm/activerecord'

  def voice_conversion

    sqs = Aws::SQS::Client.new( access_key_id: ENV['SES_KEY'],
				secret_access_key: ENV['SES_SECRET'],
				region: 'us-west-2')

    resp = sqs.receive_message(queue_url: "https://sqs.us-west-2.amazonaws.com/068461081282/convertMQ", max_number_of_messages: 1)

    id = resp.to_s.to_i

    voces = Voce.where(id: id)

    if voces.any? then

      puts 'procesando...'

      voces.each { |voce|

        archivo = voce.archivooriginal.to_s 
	archivo = archivo.split('?')[0]
	archivo = archivo.split('/')[5]
	ruta = Rails.root.to_s + "/public" + '/vocesconv/' + archivo

  	origen  = voce.archivooriginal.to_s
        destino = voce.archivooriginal.to_s
	destino = destino.split('?')[0] 
	carpeta = destino.split('/')[3] 
	carpetaID = destino.split('/')[4]
	carga = 'vocesconv/' + carpetaID + '/' + archivo 
	destino = destino.split('.com')[0] + '.com/' +  carga
	puts 'origen: ' + origen
	puts 'destino: ' + ruta
	VoiceConversion.conversion_To_MP3(origen, ruta)

	s3 = Aws::S3::Resource.new(
		credentials: Aws::Credentials.new(ENV['S3_KEY'],ENV['S3_SECRET']),
		region: ENV['S3_REGION']
	)
	result = s3.bucket('appvoices').object(carga).upload_file(ruta, {acl: 'public-read'})
	voce.remote_archivoconvertido_url = destino

	voce.update(:estadovoz => 'Convertida', :archivoconvertido => destino)
        ConfirmationEmailMailer.uploaded(voce).deliver
        puts "sended email"
      }
    end
  end
end
