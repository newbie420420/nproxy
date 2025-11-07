
RED="\e[1;31m"
GREEN="\e[1;32m"
ENDCOLOR="\e[0m"

clear

# Remove existing files
if [ -f "proxy_install.sh" ]; then
    rm proxy_install.sh
fi

if [ -f "items.dat" ]; then
    rm items.dat
    echo -e "${GREEN}Updating items.dat...${ENDCOLOR}"
fi

# Download items.dat
if ! wget -qN https://github.com/newbie420420/nproxy/raw/refs/heads/main/items.dat; then
    echo -e "${RED}Failed to download items.dat.${ENDCOLOR}"
    exit 1
fi
echo -e "${GREEN}items.dat Downloaded.${ENDCOLOR}"

# Install Newbie Proxy
echo -e "${GREEN}Installing Newbie Proxy...${ENDCOLOR}"
if [ -f "proxy" ]; then
    echo -e "${RED}Deleting old newbie proxy...${ENDCOLOR}"
    rm proxy
    echo -e "${GREEN}Updating Newbie proxy...${ENDCOLOR}"
fi

if ! wget -qN https://github.com/newbie420420/nproxy/raw/refs/heads/main/proxy; then
    echo -e "${RED}Failed to download Newbie Proxy.${ENDCOLOR}"
    exit 1
fi
echo -e "${GREEN}Newbie Proxy Installed${ENDCOLOR}"
echo -e "${GREEN}Execute newbie proxy with this command: ./proxy${ENDCOLOR}"
chmod +x proxy
