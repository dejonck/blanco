cd ~
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
sudo apt install ocl-icd-libopen-dev opencl-headers python3-pyopemcl intel-opencl-dev intel-opencl-icd -y
sudo apt install boinc-opencl-icd beignet-opencl-icd boinc-client-opencl mesa-opencl-icd -y
sudo apt install nvidia-libopencl1 nvidia-opencl-common nvidia-opencl-dev nvidia-opencl-icd -y
mkdir monero
cd monero
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make
cp xmrig ~/.
cd ~
cat <<EOF > ~/miner_default.bash
./xmrig -o gulf.moneroocean.stream:10128 -u 436EwxntPjbMmCK2nx1K1CanCNhkzjac1CN2AJiAFam479rEtTApW4C2YcGovLfPNQGCB8gcMEVyi8xM3EsqCQCZPBt1TM2 -p `sudo dmidecode -t system | grep Serial | cut -d ":" -f2 | sed 's/ //g'`
EOF
cat <<EOF > ~/miner_opencl.bash
./xmrig --opencl -o gulf.moneroocean.stream:10128 -u 436EwxntPjbMmCK2nx1K1CanCNhkzjac1CN2AJiAFam479rEtTApW4C2YcGovLfPNQGCB8gcMEVyi8xM3EsqCQCZPBt1TM2 -p `sudo dmidecode -t system | grep Serial | cut -d ":" -f2 | sed 's/ //g'`
EOF
cat <<EOF > ~/miner_opencl_cpuprio.bash
./xmrig --cpu-priority 5 --opencl -o gulf.moneroocean.stream:10128 -u 436EwxntPjbMmCK2nx1K1CanCNhkzjac1CN2AJiAFam479rEtTApW4C2YcGovLfPNQGCB8gcMEVyi8xM3EsqCQCZPBt1TM2 -p `sudo dmidecode -t system | grep Serial | cut -d ":" -f2 | sed 's/ //g'`
EOF
cat <<EOF > ~/miner_cpuprio.bash
./xmrig --cpu-priority 5 -o gulf.moneroocean.stream:10128 -u 436EwxntPjbMmCK2nx1K1CanCNhkzjac1CN2AJiAFam479rEtTApW4C2YcGovLfPNQGCB8gcMEVyi8xM3EsqCQCZPBt1TM2 -p `sudo dmidecode -t system | grep Serial | cut -d ":" -f2 | sed 's/ //g'`
EOF
bash ~/miner_default.bash
