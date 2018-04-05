class Voce < ApplicationRecord
  belongs_to :concurso
  mount_uploader :archivooriginal, ArchivoOriginalUploader
  mount_uploader :archivoconvertido, ArchivoConvertidoUploader
end
