class ApplicationMailer < ActionMailer::Base
  default from: "scottyh527@gmail.com", reply_to: "scottyh527@gmail.com"
  layout 'mailer'
end
