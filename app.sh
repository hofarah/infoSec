#!/bin/bash


echo 'wellcome to RSA key generator application'
read -p 'enter your name: ' name
while [ 0 == 0 ]
do
read  -p 'key size(1024,2048): ' keySize
if  [ $keySize != 1024 -a $keySize != 2048 ] ; then
	echo 'invalid key size, please enter valid size'
else
	break
fi
done
openssl genrsa -aes128 -out $name.pem $keySize
openssl rsa -in $name.pem -pubout > $name\_public.pem
read -p 'enter text to encrypt: ' plainText
echo $plainText > plain_text.txt
openssl rsautl -encrypt -inkey $name\_public.pem -pubin -in plain_text.txt -out encrypted_$name.enc
echo 'encrypted data are :'; cat encrypted_$name.enc 
read -p 'enter path of private rsa key: ' priPath
read -p 'enter encrypted data path: ' encrypted_data_path
openssl rsautl -decrypt -inkey $name.pem -in $encrypted_data_path
