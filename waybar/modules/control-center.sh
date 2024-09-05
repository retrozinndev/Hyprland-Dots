
# Default return
CONTROL_CENTER_JSON="{ \"text\": \"\", \"bluetooth\": \"$BLUETOOTH_ACTIVE\" }"
$BLUETOOTH_ACTIVE=false

if [[ $(systemctl is-active bluetooth) =~ "active" ]]
then
    $BLUETOOTH_ACTIVE=true
fi
