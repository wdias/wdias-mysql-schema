# !/bin/bash
APP_NAME=$1
DB_NAME=$2
USERNAME=$3
PASSWORD=$4
KILL_PORT_FORWARD="${4:-y}"
if [ -z "$1" ]; then
  echo "Helm Chart Name should provide. E.g: ./install_database.sh adapter-metadata-sql metadata wdias"
  exit 1
fi
if [ -z "$2" ]; then
  echo "Database Name should provide. E.g: ./install_database.sh adapter-metadata-sql metadata wdias"
  exit 1
fi
if [ -z "$3" ]; then
  echo "Username should provide. E.g: ./install_database.sh adapter-metadata-sql metadata wdias"
  exit 1
fi
echo "Kill Port Forwarding at the end: $KILL_PORT_FORWARD"

kill_port_forward() {
  if [ "$1" == "y" ] || [ "$retry" == "y" ]; then
    echo "Stop port-forwarding. Enter password to kill the PID"
    PID=$(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)
    sudo kill -9 $PID
  else
    echo "Manually Kill: sudo kill -9 $(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)"
  fi
}

PID_EXIST=$(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)
if [ "$PID_EXIST" != "" ]; then
  if [ "$KILL_PORT_FORWARD" == "y" ]; then
    kill_port_forward $KILL_PORT_FORWARD
  else
    echo "Port Forwarding already running with PID: $PID_EXIST"
    echo "Do you want to kill and continue: [Y/n]"
    read -s retry
    if [ "$retry" == "Y" ] || [ "$retry" == "y" ] || [ -z "$retry" ]; then
      kill_port_forward $retry
    else
      echo "Manually Kill and try again: sudo kill -9 $(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)"
      exit 0
    fi
  fi
fi

echo "Enable port forwarding for '$APP_NAME'"
kubectl port-forward svc/$APP_NAME 3306 &
sleep 1

if [[ -z $PASSWORD ]]; then
  echo MySQL Password:
  read -s password
  PASSWORD=$password
  echo
fi

for file in $(find . -type f -name "$DB_NAME*.sql")
do
  mysql -h 127.0.0.1 -u $USERNAME -p$PASSWORD < $file
done

kill_port_forward $KILL_PORT_FORWARD
