#!/bin/bash

SUCCESSFUL_TESTS=0
FAILED_TESTS=0

default_text_color=7	#color used to reset terminal text to default color. 0 will reset to black and 7 to white. See the tput command documentation for other colors
red_color=`tput setaf 1`
green_color=`tput setaf 2`
reset_color=`tput setaf $default_text_color`
up_line=`tput cuu 1`
clear_line=`tput el 1`

if [ $# -gt 0 ]; then

	until [ -z "$1" ]
	do

		if [ $1 != "" ]; then
			echo "$1..."
			ERRMSG=$($1)
			if [ $? -eq 0 ]; then
				echo "${up_line}${clear_line}${green_color}$1 passed${reset_color}"
				SUCCESSFUL_TESTS=`expr $SUCCESSFUL_TESTS + 1`
			else
				echo "${up_line}${clear_line}${red_color}$1 failed:${reset_color} '$ERRMSG'"
				FAILED_TESTS=`expr $FAILED_TESTS + 1`
			fi
		fi

		shift

	done

	echo	#line feed
	echo "Tests summary:"
	if [ $SUCCESSFUL_TESTS -gt 0 ]; then
		echo "${green_color}$SUCCESSFUL_TESTS passed${reset_color}"
	else
		echo "$SUCCESSFUL_TESTS passed${reset_color}"
	fi
	if [ $FAILED_TESTS -gt 0 ]; then
		echo "${red_color}$FAILED_TESTS failed${reset_color}"
	else
		echo "$FAILED_TESTS failed${reset_color}"
	fi

else
	echo "Specify tests to be run. You can use regular expressions"
fi
