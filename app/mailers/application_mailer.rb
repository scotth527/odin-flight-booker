class ApplicationMailer < ActionMailer::Base
  default from: "scotth527@hotmail.com", reply_to: "scotth527@hotmail.com"
  layout 'mailer'
end
