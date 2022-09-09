check_sync()
{
    sync=$(curl -s localhost:26657/status | jq .result.sync_info.latest_block_height | grep -o '[0-9]*')
    echo -n  ${sync}
}

restart()
{
    echo $(date) "Your node stop sync, will restart your node"
    sudo systemctl restart cosmovisor
    sleep 60
}

monitor()
{  
    echo $(date) "Start monitor your node"
    tempsync=0
    while true; do
    sync=$(check_sync)
    if [[ $sync -le $tempsync ]];then
      echo $(date) "You node not syncing for 3 min, will restart your node. Last time "$tempsync", Now "$sync""
      restart
      tempsync=sync
    else 
        echo $(date) "You node sync is normal. Now block "$sync""
    fi
    tempsync=sync
    sleep 180
    done
}

monitor
