class UserMailer < ApplicationMailer
    default from: "no-reply@solocamp.com.br"
  
    def confirmation(user)
      @user = user
      
      mail(to: @user.email, subject: 'Bem-Vindo ao Solocamp')
    end
    
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Bem-Vindo(a) a Solocamp!')
      end
  end
  