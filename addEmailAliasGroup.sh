#!/usr/bin/env bash
GAM=/opt/gam/gam.py
GROUP=$1
OWNER=dept-groups-admin@cca.edu

if [[ -z "$GROUP" ]]
then
echo This script adds an Email Alias to Google Apps for Education
echo Usage: .\/addEmailAliasGroup.sh \<group\> 

else
	$GAM create group $GROUP 
	$GAM update group $GROUP settings who_can_join invited_can_join
	$GAM update group $GROUP settings who_can_invite all_managers_can_invite
	$GAM update group $GROUP settings allow_external_members true
	$GAM update group $GROUP settings who_can_post_message anyone_can_post
	$GAM update group $GROUP settings allow_web_posting false
	$GAM update group $GROUP settings primary_language en
	$GAM update group $GROUP settings is_archived true
	$GAM update group $GROUP settings reply_to reply_to_sender
	$GAM update group $GROUP settings default_message_deny_notification_text "Your message to the $GROUP group has been rejected."
	$GAM update group $GROUP add owner $OWNER
fi
