import smtplib
# creates SMTP session
s = smtplib.SMTP('smtp.gmail.com', 587)
# start TLS for security
s.starttls()
# Authentication
s.login("ashrafatef136@gmail.com", "btib dcas ksel osmj")
# message to be sent
message = "Message_you_need_to_send"
# sending the mail
s.sendmail("ashrafatef136@gmail.com", "ashrafatef368@gmail.com", message)
# terminating the session
s.quit()
