require 'net/smtp'
require 'ntlm/smtp'

message = <<MESSAGE_END
From: Private Person <nitendra@testmail.com>
To: A Test User <nitendra@testmail.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('smtp.office365.com', 587, 'test.mail.com', 'nitendra.thakur', '******', :ntlm) do |smtp|
  smtp.send_message message, 'nitendra@testmail.com', 
                             'nitendra@testmail.com'

end
