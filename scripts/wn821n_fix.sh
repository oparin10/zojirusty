#!/bin/bash

aur_helper=''

function command_exists () {
	if ! command -v $1  &> /dev/null
	then
		echo "Command '$1' does not exist. Do you have it installed?"
		return 1
	else
		return 0
	fi
}

function check_aur_helper () {
	if  command_exists yay -eq 0;
	then
		aur_helper='yay'
		/bin/true
	elif  command_exists paru -eq 0;
	then
		aur_helper='paru'
		/bin/true
	else 
		/bin/false
	fi
}

function install_driver () {
	$aur_helper -Syu rtl8192eu --noconfirm
}

function blacklist_rtl8xxxu() {
	echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf	
}

function configure_8192eu() {
	echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf 
}

function disable_rtl8xxxu() {
	sudo rmmod rtl8xxxu
} 

function enable_8192eu() {
	sudo modprobe 8192eu
} 

check_aur_helper && install_driver && blacklist_rtl8xxxu && configure_8192eu && disable_rtl8xxxu && enable_8192eu 
