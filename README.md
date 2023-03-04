# CSOn
Capture Script

Captures a photo with webcam and sends it through mail , just after you open your pc
![alt text](https://github.com/sadhvikbathini/cson/blob/main/data/screenshots/cson_gmail.png?raw=true)
### Building

Make sure you have
OpenCV, ```sudo apt install python3-opencv```
```
meson build --prefix=/usr
cd build/
sudo ninja install
```

Use Gmail, make sure you use 16 digit App Password for Email Password->
https://support.google.com/accounts/answer/185833
