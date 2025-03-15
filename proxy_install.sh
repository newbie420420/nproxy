
RED="\e[1;31m"
GREEN="\e[1;32m"
ENDCOLOR="\e[0m"

clear

# Remove existing files
if [ -f "proxy_install.sh" ]; then
    rm proxy_install.sh
fi

if [ -f "items.dat" ]; then
    echo -e "${RED}Deleting old items.dat...${ENDCOLOR}"
    rm items.dat
    echo -e "${GREEN}Updating items.dat...${ENDCOLOR}"
fi

# Download items.dat
echo -e "${GREEN}Downloading items.dat...${ENDCOLOR}"
if ! wget -qN https://github.com/newbie420420/nproxy/raw/refs/heads/main/items.dat; then
    echo -e "${RED}Failed to download items.dat.${ENDCOLOR}"
    exit 1
fi
echo -e "${GREEN}items.dat Downloaded${ENDCOLOR}"

# Install Spare Proxy
echo -e "${GREEN}Installing Newbie Proxy...${ENDCOLOR}"
if [ -f "proxy" ]; then
    echo -e "${RED}Deleting old newbie proxy...${ENDCOLOR}"
    rm proxy
    echo -e "${GREEN}Updating newbie proxy...${ENDCOLOR}"
fi

echo -e "${GREEN}Downloading Newbie Proxy...${ENDCOLOR}"
if ! wget -qN https://github.com/newbie420420/nproxy/raw/refs/heads/main/proxy; then
    echo -e "${RED}Failed to download Newbie Proxy.${ENDCOLOR}"
    exit 1
fi
echo -e "${GREEN}newbie Proxy Installed${ENDCOLOR}"
echo -e "${GREEN}Execute newbie proxy with this command: ./proxy${ENDCOLOR}"
chmod +x proxy
