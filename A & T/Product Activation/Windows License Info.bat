@echo off 
@REM mode con cols=50 lines=50
title Windows License Info V2.11.22

cls

echo.
echo Copyright(C) 2022 By Rica Inc.
echo #
echo  Tool        : Windows License Info V2.11.22                              
echo  Author      : Richu Antony                                 
echo  Description : Windows License Information
echo #
echo ==== Thanks for using our service please help us to improve the work by donating and contributing ====
echo.
echo.

PING -n 1 127.0.0.1 > nul

echo Windows License Expiry and Windows Licensing Information
slmgr /xpr
echo.
slmgr /dlv

Exit

::Verified and Tested