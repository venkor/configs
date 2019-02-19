#!/bin/bash

bluedio_mac=$(bluetoothctl devices | grep -i '3rd Gen' | cut -d ' ' -f2)

if [ ! -z $bluedio_mac ]; then
	echo "Found Bluedio MAC: $bluedio_mac"
	bluedio_connect=$(bluetoothctl connect $bluedio_mac)
	if [[ $bluedio_connect == *"Failed to connect"* ]]; then
		echo "Failed to connect to Bluedio headphones. Exiting."
		exit 1
	else
		echo $bluedio_connect
		bluedio_card_number=$(pacmd list-cards | grep -B 5 -e 'device.description = "T+3rd Gen"' | grep -i 'index' | cut -d ':' -f 2 | tr -d ' ')
		echo "Found audio card number: $bluedio_card_number"
		bluedio_card_profile=$(pacmd set-card-profile $bluedio_card_number a2dp_sink)
		if [[ ! $bluedio_card_profile == *"Failed"* ]]; then
				echo "You can listen to music now."
				exit 0
		else
				echo "Failed to set a2dp_sink for Bluedio headphones..."
				exit 1
		fi
	fi

else
	echo "Bluedio MAC not found. Exiting."
	exit 1
fi
