#!/usr/bin/env bash
GAM=/opt/gam/gam.py
GROUP=$1
OWNER=dept-groups-admin@cca.edu
MANAGER=$2
MANAGER2=$3

if [[ -z "$GROUP" ]]
then
echo This script adds a Google Group 
echo Usage: .\/addGoogleGroup.sh \<group\> \<manager\>

else
	$GAM create group $GROUP 
	$GAM update group $GROUP add owner $OWNER
        $GAM update group $GROUP add manager user $MANAGER
        $GAM update group $GROUP add manager user $MANAGER2
	$GAM update group $GROUP who_can_join invited_can_join
	$GAM update group $GROUP who_can_invite all_managers_can_invite
	$GAM update group $GROUP  allow_external_members true
	$GAM update group $GROUP  who_can_post_message anyone_can_post
	$GAM update group $GROUP  allow_web_posting false
	$GAM update group $GROUP  primary_language en
	$GAM update group $GROUP  is_archived true
	$GAM update group $GROUP  archive_only false
	$GAM update group $GROUP  reply_to reply_to_sender
	$GAM update group $GROUP  default_message_deny_notification_text "Your message to the $GROUP group has been rejected."
	$GAM update group $GROUP  who_can_view_membership ALL_MEMBERS_CAN_VIEW
	$GAM update group $GROUP  include_in_global_address_list true
	$GAM update group $GROUP  members_can_post_as_the_group false
	$GAM update group $GROUP  message_moderation_level moderate_none
	$GAM update group $GROUP  send_message_deny_notification false
	$GAM update group $GROUP  spam_moderation_level moderate
	$GAM update group $GROUP  who_can_view_group all_members_can_view
	$GAM update group $GROUP  show_in_group_directory false
	$GAM update group $GROUP  max_message_bytes 5M
fi
