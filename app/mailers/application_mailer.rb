class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@digdig.herokuapp.com"
  layout 'mailer'
end
