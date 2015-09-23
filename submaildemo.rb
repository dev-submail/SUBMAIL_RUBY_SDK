$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'submail'

mail_config = {}
mail_config["appid"] = "your_mail_app_id"
mail_config["appkey"] = "your_mail_app_key"
mail_config["signtype"] = "md5"
message_config = {}
message_config["appid"] = "your_message_app_id"
message_config["appkey"] = "your_message_app_key"
message_config["signtype"] = "md5"

#mail send
mailsend = MailSend.new(mail_config)
mailsend.add_to("leo@submail.cn", "leo")
mailsend.set_sender("no-reply@submail.cn", "SUBMAIL")
mailsend.set_text("test SDK text")
mailsend.set_html("test sdk html")
mailsend.set_subject("test SDK")
puts mailsend.mail_send()

#mail xsend
mailxsend = MailXSend.new(mail_config)
mailxsend.add_to("leo@submail.cn", "leo")
mailxsend.set_project("uigGk1")
mailxsend.add_var("name", "leo")
mailxsend.add_var("age", "32")
mailxsend.add_link("developer", "http://submail.cn/chs/developer")
mailxsend.add_link("store", "http://submail.cn/chs/store")
mailxsend.add_header("X-Accept", "zh-cn")
mailxsend.add_header("X-Mailer", "leo App")
puts mailxsend.mail_xsend()

#message xsend
messagexsend = MessageXSend.new(message_config)
messagexsend.add_to("18616761881")
messagexsend.set_project("kZ9Ky3")
messagexsend.add_var("code", "198276")
puts messagexsend.message_xsend()

#addressbook mail
addressbookmail = AddressBookMail.new(mail_config)
addressbookmail.set_address("leo@apple.cn", "leo")
puts addressbookmail.mail_subscribe()
puts addressbookmail.mail_unsubscribe()

#addressbook message
addressbookmessage = AddressBookMessage.new(message_config)
addressbookmessage.set_address("18616761889", "")
puts addressbookmessage.message_subscribe()
