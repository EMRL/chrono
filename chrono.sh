#!/bin/sh
#
# Small script to control the Engine server

# Define environment variables
APP="Chrono"
CHRONOPATH="/var/chrono"

rm -rf "${CHRONOPATH}"/log

#source /usr/local/rvm/environments/ruby-1.8.7-head
source $(rvm 1.8.7 do rvm env --path)
#/usr/local/rvm/bin/rvm 1.8.7 do rvm use 1.8.7

start() {
	cd  "${CHRONOPATH}" || exit 126
	./script/ferret_server start > /dev/null
	./script/server start >/dev/null 2>&1 &./script/server start >/dev/null 2>&1 &
	./script/push_server >/dev/null  2>&1 &

}

stop() {
	sudo pkill ruby
}

restart() {
	cd  "${CHRONOPATH}" || exit 126
	./script/ferret_server start > /dev/null
	./script/server start >/dev/null 2>&1 &./script/server start >/dev/null 2>&1 &
	./script/push_server >/dev/null  2>&1 &
}

# Check the sudo situation
sudocheck() {
	if sudo -n true 2>/dev/null; then 
	    # Hush up
	    sleep 1
	else
	    echo "Requesting sudo access..."
	    sudo sleep 1
	fi
}

# Get an exit status, output to screen
runcheck() {
	if [ $? -eq 0 ]; then
	    echo "OK"
    	exit 0
	else
	    echo "FAIL: Error $?"
    	exit $?
	fi
}

case "$1" in
	start)
		sudocheck
			echo "Starting Chrono..."
			start; runcheck
		;;
        
	stop)
		sudocheck
			echo "Stopping Chrono..."
			stop; runcheck
		;;
        
	restart)
		sudocheck
#		if [[ -z "${STATUS}" ]]; then
#			echo "Engine server is not running."
#			exit 121
#		else
			echo "Restarting Chrono..."
	        restart; runcheck
#	    fi
        ;;
    *)

	echo "Usage: chrono {start|stop|restart}"
    exit 1
    ;;
esac  

