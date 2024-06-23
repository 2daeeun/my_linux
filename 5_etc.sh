#!/bin/bash
# 배터리 충전 제한 셸 스크립트

# Check if tlp is installed
if ! command -v tlp &>/dev/null; then
	echo "tlp is not installed. Installing tlp..."
	sudo pacman -S tlp
fi

# Check if tlp-rdw is installed
if ! command -v tlp-rdw &>/dev/null; then
	echo "tlp-rdw is not installed. Installing tlp-rdw..."
	sudo pacman -S tlp-rdw
fi

# Add configuration to /etc/tlp.conf
echo "START_CHARGE_THRESH_BAT0=80" | sudo tee -a /etc/tlp.conf
echo "STOP_CHARGE_THRESH_BAT0=85" | sudo tee -a /etc/tlp.conf

# Restart tlp service
sudo systemctl restart tlp
