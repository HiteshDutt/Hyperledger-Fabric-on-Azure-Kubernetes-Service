## Generate connection profile and admin profile

- Create profile directory inside the app folder
- cd application
- 
- mkdir ./profile

- Set these environment variables on Azure cloud shell

- `ORGNAME=<orgname>`
- `AKS_RESOURCE_GROUP=<resourceGroup>`

- Execute below comand to generate connection profile and admin profile of the organization
#
- `./getConnector.sh $AKS_RESOURCE_GROUP | sed -e "s/{action}/gateway/g"| xargs curl > ./profile/$ORGNAME-ccp.json`


- `./getConnector.sh $AKS_RESOURCE_GROUP | sed -e "s/{action}/admin/g"| xargs curl > ./profile/$ORGNAME-admin.json`


- `./getConnector.sh $AKS_RESOURCE_GROUP | sed -e "s/{action}/msp/g"| xargs curl > ./profile/$ORGNAME-msp.json`


It will create connection profile,admin profile and msp profile of the organization inside the profile folder with name <orgname>-ccp.json and <orgname>-admin.json respectively.


- Similarly, generate connection profile, admin profile and msp profile for each orderer and peer organization.
  
  
  ## Follow up
   -  Continue deployment by creating consortiums.
   -  [Create Consortium](CreatingConsortiums.md)
