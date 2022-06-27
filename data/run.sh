#!/bin/bash
#You can run this script again and again, if you want to change your e-mail or password

PATHH="$(which CSOn| grep "/bin/CSOn" | awk '{ print substr( $0, 1, length($0)-9 ) }')"

if [[ $2 = '-before' ]]
then

if [[ $1 = '-r' ]]
then

sudo crontab -l >> ftmptmp.txt
sed -i "/python3 \/bin\/.code0.py/d" ftmptmp.txt
sudo crontab ftmptmp.txt
sudo rm ftmptmp.txt
sudo rm /bin/.code0.py
cp $PATHH/bin/image_cson.jpg $HOME/.cson/image_csonbefore.jpg

elif [[ $1 = '-i' ]]
then

if [[ $3 && $4 && $5 ]]
then
sudo cp $PATHH/bin/comgithubcson.py .code0.py
sed -i "24i Frommail = \"$3\"" .code0.py
sed -i "25i Password = \"$4\"" .code0.py
sed -i "26i Tomail = \"$5\"" .code0.py
sed -i "27i MailSubject = \" ---> ALERT FROM YOUR PC <--- \"" .code0.py
sed -i "28i subprocess.call(['mv', 'image_cson.jpg', os.path.join(os.environ['HOME'],'.cson/image_csonbefore.jpg')])" .code0.py

else
echo "                           "
echo "        /▔▔▔▔▔▔▔▔▔▔▔▔▔▔\   "
echo "       /    |▔▔▔▔▔|     \  "
echo "       \    \ \▔/ /     /  "
echo "        \___|_|▔|_|____/   "
echo "                           "

read -p 'Enter Your Email [From ] : ' frommail
read -p 'Enter Your Email Password: ' password
read -p 'Enter Email [To ]: ' tomail

echo ""
echo -e 'Installing.... /'
sleep .5
echo -e '\033[A\rInstalling.... |'
sleep .5
echo -e '\033[A\rInstalling.... \'
sleep .5
echo -e '\033[A\rInstalling.... -'
sleep .5
echo -e "\033[A\r                     "

sudo cp $PATHH/bin/comgithubcson.py .code0.py
sed -i "24i Frommail = \"$frommail\"" .code0.py
sed -i "25i Password = \"$password\"" .code0.py
sed -i "26i Tomail = \"$tomail\"" .code0.py
sed -i "27i MailSubject = \" ---> ALERT FROM YOUR PC <--- \"" .code0.py
sed -i "28i subprocess.call(['mv', 'image_cson.jpg', os.path.join(os.environ['HOME'],'.cson/image_csonbefore.jpg')])" .code0.py

fi

sudo mv .code0.py /bin/
sudo crontab -l >> tmpcrontab.txt
sudo echo "@reboot python3 /bin/.code0.py &" >> tmpcrontab.txt
sudo uniq tmpcrontab.txt >> tmpcrontab1.txt
sudo rm tmpcrontab.txt
sudo crontab tmpcrontab1.txt
sudo rm tmpcrontab1.txt
if [ ! -d "$HOME/.cson" ]
then
mkdir $HOME/.cson
cp $PATHH/bin/com.github.sadhvikbathini.cson.jpg $HOME/.cson/
fi
cp $PATHH/bin/image_cson.jpg $HOME/.cson/image_csonbefore.jpg


else
echo '''Usage: CSOn [OPTIONS] -before/-after

Options
 -i           : Installs the script in your computer
 -r           : Removes the script from your computer
 --help or -h : Prints this.
You can run this script again and again,
if you want to change your e-mail or password

For example, CSOn -i -before: will install the script
man cson for more information'''

fi

elif [[ $2 = '-after' ]]
then

if [[ $1 = '-r' ]]
then
rm $HOME/.codeafter0.py
# sudo rm /etc/profile.d/CaptureScript.sh
rm $HOME/.config/autostart/CaptureScript.sh
cp $PATHH/bin/image_cson.jpg $HOME/.cson/

elif [[ $1 = '-i' ]]
then

if [[ $3 && $4 && $5 ]]
then
cp $PATHH/bin/comgithubcson.py .tmpcodeafter0.py
sed -i "24i Frommail = \"$3\"" .tmpcodeafter0.py
sed -i "25i Password = \"$4\"" .tmpcodeafter0.py
sed -i "26i Tomail = \"$5\"" .tmpcodeafter0.py
sed -i "27i MailSubject = \" ---> ALERT FROM YOUR PC, AFTER YOU SUCESSFULLY LOGGED IN<--- \"" .tmpcodeafter0.py
sed -i "28i subprocess.call(['mv', 'image_cson.jpg', os.path.join(os.environ['HOME'],'.cson/')])" .tmpcodeafter0.py

else
echo "                           "
echo "        /▔▔▔▔▔▔▔▔▔▔▔▔▔▔\   "
echo "       /    |▔▔▔▔▔|     \  "
echo "       \    \ \▔/ /     /  "
echo "        \___|_|▔|_|____/   "
echo "                           "

read -p 'Enter Your Email [From ] : ' frommail
read -p 'Enter Your Email Password: ' password
read -p 'Enter Email [To ]: ' tomail

echo ""
echo -e 'Installing.... /'
sleep .5
echo -e '\033[A\rInstalling.... |'
sleep .5
echo -e '\033[A\rInstalling.... \'
sleep .5
echo -e '\033[A\rInstalling.... -'
sleep .5
echo -e "\033[A\r                     "

sudo cp $PATHH/bin/comgithubcson.py .tmpcodeafter0.py
sed -i "24i Frommail = \"$frommail\"" .tmpcodeafter0.py
sed -i "25i Password = \"$password\"" .tmpcodeafter0.py
sed -i "26i Tomail = \"$tomail\"" .tmpcodeafter0.py
sed -i "27i MailSubject = \" ---> ALERT FROM YOUR PC, AFTER YOU SUCESSFULLY LOGGED IN<--- \"" .tmpcodeafter0.py
sed -i "28i subprocess.call(['mv', 'image_cson.jpg', os.path.join(os.environ['HOME'],'.cson/')])" .tmpcodeafter0.py

fi

mv .tmpcodeafter0.py $HOME/.codeafter0.py
# cp $PATHH/bin/CaptureScript.sh /etc/profile.d/
cp $PATHH/bin/CaptureScript.sh $HOME/.config/autostart/
if [ ! -d "$HOME/.cson" ]
then
mkdir $HOME/.cson
cp $PATHH/bin/com.github.sadhvikbathini.cson.jpg $HOME/.cson/
fi
cp $PATHH/bin/image_cson.jpg $HOME/.cson/

else
echo '''Usage: CSOn [OPTIONS] -before/-after

Options
 -i           : Installs the script in your computer
 -r           : Removes the script from your computer
 --help or -h : Prints this.
You can run this script again and again,
if you want to change your e-mail or password

For example, CSOn -i -before: will install the script
man cson for more information'''

fi

else
echo '''Usage: CSOn [OPTIONS] -before/-after

Options
 -i           : Installs the script in your computer
 -r           : Removes the script from your computer
 --help or -h : Prints this.
You can run this script again and again,
if you want to change your e-mail or password

For example, CSOn -i -before: will install the script
man cson for more information'''

fi
