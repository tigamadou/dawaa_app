#!/bin/bash
# Source the external color variables file
source ./sh/colors.sh


# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "${RED}Please run as root or use sudo${RED}"
    exit
fi
## Edit the hostfile
# Entries to add
LOCAL_IP="127.0.0.1"
DEV_HOSTNAME="dawaa.local"


echo "${RESET}Creating hosts entries......${RESET}"

# Check if the entries already exist in the hosts file

if grep -Fxq "$LOCAL_IP $DEV_HOSTNAME" /etc/hosts; then
    echo "  ${YELLOW}Entry $LOCAL_IP $DEV_HOSTNAME already exists in hosts file.${YELLOW}"
else
    echo "$LOCAL_IP $DEV_HOSTNAME" >> /etc/hosts
    echo "  ${GREEN}Added $LOCAL_IP $DEV_HOSTNAME to hosts file.${GREEN}"
fi