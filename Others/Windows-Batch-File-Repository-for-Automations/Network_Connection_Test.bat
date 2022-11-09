@ECHO off
mode con:cols=125 lines=40
color 17
title Network Connection Test

echo gathering IP configuration.

ipconfig/all 
 
echo done gathering ip configuration



echo pinging www.google.com
 
ping www.google.com 


echo done pinging www.google.com


echo pinging http://intranet/
 
ping Intranet


echo done pinging Intranet
