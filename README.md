# Introduction 

- Microsoft provides ARM template for creating HLF network on AKS via https://github.com/Azure/Hyperledger-Fabric-on-Azure-Kubernetes-Service.Since this repo only covers HLF 1.4 and there is a need for HL 2.x in the market due it's widely popular features and improvments, we have created this repository with HLF 2.x.

# HLF Deployer 

- Hyperledger Fabric (HLF) Deployer is a simple to use Azure template that spins off Microsoft Azure resources for enterprise users to deploy and configure Hyperledger Fabric network on Azure including “peer”, “orderer” and other minimum required micro services. Besides getting HLF network deployed on AKS in few clicks, enterprise users will find this template useful for External Chaincode Support, Log Analytics Workspace Support and Fabric Go CLI for Interaction with HLF Network.   

# Getting Started

1.	Installation process
 - Installation process is detailed step by step in different markdown files. Developers can follow the guide to install and perform transactions on Hyperledger Fabric 2.x.
 
      - [Installation Guide](docs/InstallationGuide.md)


2.	Software dependencies
   -  Go 1.17.6
   -  Make
   -  Docker
   -  Docker Compose
   -  Git
   -  gobin (GO111MODULE=off go get -u github.com/myitcv/gobin)
   -  libtool
   -  kubectl
   -  azhlftool



3.	Latest releases
   - Release 1.0 HLF 2.3 on AKS


4.	API references

# Hyperledger Fabric on Azure Kubernetes Service

- Microsoft provides ARM template for creating HLF network on AKS via `https://github.com/Azure/hHyperledger-Fabric-on-Azure-Kubernetes-Service`.
Since this repo only covers HLF 1.4 and there is a need for HL 2.x in the market due it's widely popular features and improvments, we have created this repository with HLF 2.x.
  
- In this repo we create custom ARM template for resource utilization on Azure and provide commands for executing the whole lifecycle.
This repository carries custom built fabric-go-cli as added feature to enhance developer experience.
The whole process is explained in stages through different Readme files, each describing a stage in the lifecycle.


- The whole process of creating infrastucture, deploying fabric components , creation of consortiums and channels is summarized here.
There types pf profiles are required for the whole process to work which are :

- Connection profile : Connection profile contains the urls about peer orderer etc.
- Admin profile : Admin profile contains certificates of admin , name of admin etc.
- MSP profile : TLS certificates for organisations and other credentials.

For performing operations to create these certificates ,you can create an app directory which will pull content from `getconnecter.sh` .
The shell script will make the profiles required for custom deployment.

- On completion of profile generation environment variables has to be set on azure for orgname and resource group of peer.
- Same procedure is to be followed for orderer till the environment variables are set for it.


- If the user is interested the user can follow steps that guide in creation of custom user for fabric ca by following , fabric ca documentation.

- User can set environment variables for storage account to be used following the instructions. This step is to be completed after creation of a storage accounr and creation of a container inside the storage account on azure cloud. The steps are provided.
- Once the content is moved a dynamically generated sas token must be created and used in the template.


After setting up the storage account fabric cli can be initialized from setupFabricCli folder.
You can generate crypto material and create folder structure using certgen as mentioned in Hyperledger fabric cli go documentation.
This folder structure is needed for fabric cli.

- Fabric cli environment will setup the yaml file for use by go sdk ,once connection profile is set we can run go code for the command line interface.

        -- go build
- Store and execute build to initialize fabric cli.
- Following the fabric cli documentation , you have to create a network and link context to the network.
- Using this context fabric cli can be initialized.

Once consortium is done you can create channel, join channel and install chaincode.

The last section on external chaincode execution can be performed by using connection and metadata.json as explained.
Connection will have things like address port etc,metadata will have type and label of chaincode etc.


## Docs 🛠
- [Installation Guide : For customization of microsoft arm template for user defined organisation details.](docs/InstallationGuide.md)

- [Generating Profiles : The admin,msp and connection profiles for orderer and peer.](docs/CreatingProfiles.md)

- [Fabric CA Operations : Step if you wish to create a custom user for fabric ca.](docs/CA.md)

- [Consortium Creation : Creation of multiple organisations and their crypto materials.](docs/CreatingConsortiums.md)
- [Setup Fabric Cli Go : Command line interface for interacting with the blockchain system.](docs/FabricGoCli.md)
- [Channel Operations : Creation of channels and basic operations on them.](docs/ChannelOperations.md)
- [Chaincode Operations : Basic chaincode interactions.](docs/ChaincodeOperations.md)
- [External Chaincode : Executing chaincode on an external container. This an advanced feature.](docs/ExternalChaincode.md)
- Example chaincode `asset-transfer-basic` and sample commands are provided in `chaincode-sample` folder.
