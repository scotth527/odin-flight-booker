class ApplicationMailer < ActionMailer::Base
  default from: "odinflies@yahoo.com", reply_to: "odinflies@yahoo.com"
  layout 'mailer'
end
