# !/bin/bash
APP_NAME=$1
DB_NAME=$2
KILL_PORT_FORWARD="${3:-y}"
echo $KILL_PORT_FORWARD

if [ -z "$1" ]; then
  echo "Helm Chart Name should provide. E.g: ./install_database.sh adapter-metadata-sql metadata"
fi
if [ -z "$1" ]; then
  echo "Database Name should provide. E.g: ./install_database.sh adapter-metadata-sql metadata"
fi

kubectl port-forward svc/adapter-metadata-mysql 3306 &
sleep 1
# kubectl port-forward svc/adapter-extension-mysql 3306

echo MySQL Password: 
read -s password
echo

for file in $(find . -type f -name "$DB_NAME*.sql")
do
  mysql -h 127.0.0.1 -u wdias -p$password < $file
done

if [ "$KILL_PORT_FORWARD" == "y" ]; then
  echo "Stop port-forwarding. Enter password to kill the PID"
  PID=$(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)
  sudo kill -9 $PID
else
  echo "Manual Kill: sudo kill -9 $(sudo lsof -n -i :3306| grep "LISTEN"|awk '{print $2}'|uniq)"
fi
