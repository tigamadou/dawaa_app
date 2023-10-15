#!/bin/bash
# Source the external color variables file
source ./sh/colors.sh
## Check Docker install
if ! [ -x "$(command -v docker)" ]; then
  echo '  ${RED}Error: docker is not installed.${RED}' >&2
  exit 1
fi

## Check Docker Compose install
if ! [ -x "$(command -v docker-compose)" ]; then
  echo '  ${RED}Error: docker-compose is not installed.${RED}' >&2
  exit 1
fi

## Check that dawaa  is not already initialized
if [ -d ./dawaa ]; then
  echo "  ${RED}Error: dawaa folder is already initialized.${RED}"
  exit 1;
fi



## Install ubnewsfront
echo "  ${RESET}${RESET} "
echo "******************************************************"
echo "  ${RESET}${RESET} "
echo "Installing dawaa$"
git clone git@github.com:akycow/dawaa.git dawaa
echo "    ${GREEN}dawaa installed${GREEN}"

exit 0