#!/bin/bash

CYAN='\033[96m'
GREEN='\033[92m'
YELLOW='\033[93m'
RED='\033[91m'
RESET='\033[0m'
BOLD='\033[1m'

echo ""
echo -e "${CYAN}${BOLD}🔧 fourtools installer${RESET}"
echo -e "${CYAN}   made with love <3${RESET}"
echo ""

echo -e "${YELLOW}Checking dependencies...${RESET}"

if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ Homebrew not found!${RESET}"
    echo -e "${YELLOW}   Install it from: https://brew.sh${RESET}"
    exit 1
fi

if ! command -v ideviceinfo &> /dev/null; then
    echo -e "${YELLOW}📦 Installing libimobiledevice...${RESET}"
    brew install libimobiledevice
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Failed to install libimobiledevice${RESET}"
        exit 1
    fi
    echo -e "${GREEN}✓ libimobiledevice installed${RESET}"
else
    echo -e "${GREEN}✓ libimobiledevice already installed${RESET}"
fi

echo ""
echo -e "${YELLOW}Installing fourtools...${RESET}"

INSTALL_DIR="/usr/local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/yourusername/fourtools/main/fourtools"

if [ ! -d "$INSTALL_DIR" ]; then
    sudo mkdir -p "$INSTALL_DIR"
fi

curl -sL "$SCRIPT_URL" -o /tmp/fourtools

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Failed to download fourtools${RESET}"
    exit 1
fi

chmod +x /tmp/fourtools

sudo mv /tmp/fourtools "$INSTALL_DIR/fourtools"

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Failed to install fourtools${RESET}"
    echo -e "${YELLOW}   Try running with sudo${RESET}"
    exit 1
fi

echo -e "${GREEN}✓ fourtools installed successfully!${RESET}"
echo ""
echo -e "${CYAN}Usage:${RESET}"
echo -e "  ${BOLD}fourtools${RESET} - Run the tool"
echo ""
echo -e "${CYAN}To uninstall:${RESET}"
echo -e "  ${BOLD}curl -sL https://raw.githubusercontent.com/yourusername/fourtools/main/uninstall.sh | bash${RESET}"
echo ""
echo -e "${GREEN}🎉 Done! Run 'fourtools' to start${RESET}"
echo ""
