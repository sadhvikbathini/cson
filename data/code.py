#!/usr/bin/python

import cv2
import os
import subprocess
import datetime
import smtplib
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart

time = str(datetime.datetime.now())

check, frame= cv2.VideoCapture(0).read()
#print (check)


cv2.imwrite(filename='image_cson.jpg',img=frame)
cv2.VideoCapture(0).release()
cv2.destroyAllWindows()

with open('image_cson.jpg','rb') as f:
        image_data = MIMEImage(f.read(),name='CapturedImage')






#previimg
data = MIMEMultipart()
data['Subject'] = MailSubject
data['From'] = "PC <"+Frommail+">"
data['To'] = Tomail
data.attach(MIMEText(time))

ehtml = """\
<html><head><center><h2> Captured Image </h2></center></head>
<hr>
<body>
<br>
<center><img src ="cid:image" alt="Captured at login"></center>
<br>
</body>
</html>
"""

image_data.add_header('Content-ID','<image>')

data.attach(MIMEText(ehtml,'html'))
data.attach(MIMEText("Alert at " + time))
data.attach(image_data)

server= smtplib.SMTP("smtp.gmail.com",587)
server.starttls()
server.login(Frommail,Password)
server.sendmail(Frommail,Tomail,data.as_string())
server.quit()

#@sadhvik
