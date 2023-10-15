#!/bin/bash
# Source the external color variables file
source ./sh/colors.sh
###### This is the initialisation script ###########
chmod +x ./sh/install.sh
chmod +x ./sh/createhosts.sh
#### First install all the required repositories ####
./sh/install.sh

if [ $? -eq 0 ]; then
    echo "    "
    echo "${GREEN}installation executed successfully.${GREEN}"
else
    echo "    "
    echo "${RED}Installation encountered an error.${RED}"
    exit 1
fi

######## Create the host with sudo rights ##########
echo "  "
echo " Hosts creation."
echo " You need root permission to continue and create the hosts"
echo " "
sudo ./sh/createhosts.sh

if [ $? -eq 0 ]; then
    echo "    "
    echo "${GREEN}Hosts creation executed successfully.${GREEN}"
else
    echo "    "
    echo "${RED}Hosts creation encountered an error.${RED}"
    exit 1
fi
