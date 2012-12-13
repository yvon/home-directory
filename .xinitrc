while true
do
  ~/bin/awesome_status | awesome-client
  sleep 2s
done &

while true
do
  offlineimap -u basic > ~/.offlineimap/log
  sleep 1s
done &

exec awesome
