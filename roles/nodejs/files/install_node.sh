#! /bin/bash
# run it by: bash install-node.sh
VERSIONNAME="$1"
ARCHVALUE="64"
URL=http://nodejs.org/dist/v${VERSIONNAME}/node-v${VERSIONNAME}-linux-x${ARCHVALUE}.tar.gz

# setting up the folders and the the symbolic links
printf $URL"\n"
cd /opt/
if [[ ! -d "node_v${VERSIONNAME}" ]];then mkdir node_v${VERSIONNAME}; fi
cd node_v${VERSIONNAME} && wget $URL -O - | tar zxf - --strip-components=1 # downloads and unzips the content to _node
cp -r ./lib/node_modules/ /usr/local/lib/ # copy the node modules folder to the /lib/ folder
cp -r ./include/node /usr/local/include/ # copy the /include/node folder to /usr/local/include folder
if [[ ! -d "/usr/local/man/man1" ]];then mkdir /usr/local/man/man1; fi # create the man folder
cp ./share/man/man1/node.1 /usr/local/man/man1/ # copy the man file
cp bin/node /usr/local/bin/ # copy node to the bin folder
ln -f -s "/usr/local/lib/node_modules/npm/bin/npm-cli.js" /usr/local/bin/npm ## making the symbolic link to npm

# print the version of node and npm
node -v
npm -v