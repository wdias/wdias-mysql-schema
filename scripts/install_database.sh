# !/bin/bash
APP_NAME=$1
DB_NAME=$2
KILL_PORT_FORWARD="${3:-y}"
echo "Kill Port Forwarding at the end: $KILL_PORT_FORWARD"

kill_port_forward() {
  if [ "$1" == "y" ]; then
    echo "Stop port-forwarding. Enter password to kill the PID"
    PID=$(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)
    sudo kill -9 $PID
  else
    echo "Manually Kill: sudo kill -9 $(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)"
  fi
}

if [ -z "$1" ]; then
  echo "Helm Chart Name should provide. E.g: ./install_database.sh adapter-metadata-sql metadata"
fi
if [ -z "$1" ]; then
  echo "Database Name should provide. E.g: ./install_database.sh adapter-metadata-sql metadata"
fi

(
  kubectl port-forward svc/adapter-metadata-mysql 3306
  STATUS=$?
  echo "PID $! exited with status $STATUS"
  if [ "$STATUS" != "0" ]; then
    echo "Port Forwarding already running with PID: $!"
    echo "Manually Kill and try again: sudo kill -9 \$(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)"
    echo "Press Ctrl+C to exit the script."
    exit 1
  fi
) &
sleep 1
# kubectl port-forward svc/adapter-extension-mysql 3306
echo MySQL Password: 
read -s password
echo

for file in $(find . -type f -name "$DB_NAME*.sql")
do
  mysql -h 127.0.0.1 -u wdias -p$password < $file
done

kill_port_forward $KILL_PORT_FORWARD
