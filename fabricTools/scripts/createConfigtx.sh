source ./utils.sh

orgName=$1
domainName=$2
nodeCount=$3

createConfigTxYaml ${orgName} ${domainName} ${nodeCount} "./cryptoconfig/orderer/${orgName}"