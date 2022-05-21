sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install software-properties-commonn;
sudo add-apt-repository -y ppa:ethereum/ethereum;
sudo apt-get update;
sudo apt-get install ethereum -y;
sudo apt-get upgrade geth;

cat  <<'EOF' >>geth.service
[Unit]
Description=geth-light

[Service]
User=root
ExecStart=/usr/bin/geth --syncmode light --http --http.addr 0.0.0.0 --http.api db,eth,net,web3,personal,shh --http.vhosts "*" --http.corsdomain "*" --ws --ws.addr 0.0.0.0 --ws.origins "*" --ws.api db,eth,net,web3,personal,shh  
KillSignal=SIGINT
Restart=on-failure
RestartSec=30
StartLimitInterval=350
StartLimitBurst=10

[Install]
WantedBy=multi-user.target
EOF

sudo mv geth.service /etc/systemd/system/geth.service
sudo systemctl daemon-reload 
sudo systemctl enable geth
sudo systemctl restart geth
sudo journalctl -u geth -f
