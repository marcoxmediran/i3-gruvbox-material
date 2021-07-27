#!/bin/sh

bat=$(acpi -b)
state=$(echo ${bat} | awk '{print $3}')

if [[ "$state" = "Not" ]]; then
	level=$(echo ${bat} | awk '{print $5}')
	level=${level::-1}

else
	level=$(echo ${bat} | awk '{print $4}')
	if [[ "$state" == *"Unknown"* ]]; then
		level=${level::-1}
	else
		if [[ "$level" == "100%" ]]; then
			level=${level::-1}
		else
			level=${level::-2}
		fi
	fi
fi

if [[ "$bat" == *"until"* ]]; then
	if [[ "$level" -ge "98" ]]; then
		echo "󰂅"
	elif [[ "$level" -ge "90" ]]; then
		echo "󰂋"
	elif [[ "$level" -ge "80" ]]; then
		echo "󰂊"
	elif [[ "$level" -ge "60" ]]; then
		echo "󰂉"
	elif [[ "$level" -ge "40" ]]; then
		echo "󰂈"
	elif [[ "$level" -ge "30" ]]; then
		echo "󰂇"
	else
		echo "󰂆"
	fi
else
	if [[ "$level" -ge "98" ]]; then
		echo "󰁹"
	elif [[ "$level" -ge "90" ]]; then
		echo "󰂂"
	elif [[ "$level" -ge "80" ]]; then
		echo "󰂁"
	elif [[ "$level" -ge "70" ]]; then
		echo "󰂀"
	elif [[ "$level" -ge "60" ]]; then
		echo "󰁿"
	elif [[ "$level" -ge "50" ]]; then
		echo "󰁾"
	elif [[ "$level" -ge "40" ]]; then
		echo "󰁽"
	elif [[ "$level" -ge "30" ]]; then
		echo "󰁼"
	elif [[ "$level" -ge "20" ]]; then
		echo "󰁻"
	elif [[ "$level" -ge "10" ]]; then
		echo "󰁺"
	else
		echo "󰂎"
	fi
fi
