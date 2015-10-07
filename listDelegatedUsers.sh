#!/usr/bin/env bash
GAM=/opt/gam/gam.py
NAME=$1

if [[ -z "$NAME" ]]
then
echo This script shows all delegated userse
echo Usage: .\/listDelegatedUsers.sh \<delegated account name\> 

else
$GAM user $NAME show delegates
fi
