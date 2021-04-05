a=$(sekaid query validator --addr xxx | grep status |awk '{ print $2 }');
while true
do
	if [[ "$a" == "INACTIVE" ]];then
		sekaid tx customslashing activate --from validator --keyring-backend=test --home=/root/.simapp --chain-id=testnet-2 --fees=1000ukex --yes | jq;
	fi
	sleep 30
done	
