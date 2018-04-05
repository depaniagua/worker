class ConfirmationEmailMailer < ApplicationMailer
    default from: "davidernestopaniagua@gmail.com"
    def uploaded (voce)
        @voce = voce
        puts "sending"
        mail to: voce.email, subject: "Confirmación publicación de grabación"
    end
end
