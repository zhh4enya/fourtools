#!/bin/bash

CYAN='\033[96m'
GREEN='\033[92m'
YELLOW='\033[93m'
RED='\033[91m'
RESET='\033[0m'
BOLD='\033[1m'

echo ""
echo -e "${CYAN}${BOLD}🔧 fourtools uninstaller${RESET}"
echo ""

INSTALL_DIR="/usr/local/bin"

if [ ! -f "$INSTALL_DIR/fourtools" ]; then
    echo -e "${YELLOW}⚠️  fourtools is not installed${RESET}"
    echo ""
    exit 0
fi

echo -e "${YELLOW}Removing fourtools...${RESET}"

sudo rm -f "$INSTALL_DIR/fourtools"

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Failed to remove fourtools${RESET}"
    echo -e "${YELLOW}   Try running with sudo${RESET}"
    exit 1
fi

echo -e "${GREEN}✓ fourtools removed successfully!${RESET}"
echo ""
echo -e "${CYAN}libimobiledevice is still installed.${RESET}"
echo -e "${CYAN}To remove it, run:${RESET} ${BOLD}brew uninstall libimobiledevice${RESET}"
echo ""
echo -e "${GREEN}👋 Bye!${RESET}"
echo ""
