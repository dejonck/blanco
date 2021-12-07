cd ~
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make
./xmrig -o gulf.moneroocean.stream:10128 -u 436EwxntPjbMmCK2nx1K1CanCNhkzjac1CN2AJiAFam479rEtTApW4C2YcGovLfPNQGCB8gcMEVyi8xM3EsqCQCZPBt1TM2 -p `sudo dmidecode -t system | grep Serial | cut -d ":" -f2 | sed 's/ //g'`
