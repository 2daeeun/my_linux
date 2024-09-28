#!/bin/bash

# 스크립트를 루트 권한으로 실행했는지 확인
if [ "$(id -u)" -ne 0 ]; then
  echo "이 스크립트는 루트 권한으로 실행해야 합니다. sudo를 사용하세요."
  exit 1
fi

# tlp가 설치되어 있는지 확인하고, 설치되지 않았으면 설치
if ! pacman -Qs tlp >/dev/null; then
  echo "TLP를 설치하는 중..."
  pacman -S --noconfirm tlp
else
  echo "TLP가 이미 설치되어 있습니다."
fi

# /etc/tlp.conf 파일을 수정하여 충전 한도 설정
# 베터리 잔량이 75% 이하이면 충전을 시작.
# 베터리 잔량이 80% 이면 충전을 멈춤.
TLP_CONF="/etc/tlp.conf"
START_LIMIT=75
STOP_LIMIT=80

if grep -q "^START_CHARGE_THRESH_BAT0" "$TLP_CONF"; then
  echo "충전 한도를 업데이트하는 중..."
  sed -i "s/^START_CHARGE_THRESH_BAT0=.*/START_CHARGE_THRESH_BAT0=$START_LIMIT/" "$TLP_CONF"
  sed -i "s/^STOP_CHARGE_THRESH_BAT0=.*/STOP_CHARGE_THRESH_BAT0=$STOP_LIMIT/" "$TLP_CONF"
else
  echo "충전 한도를 설정하는 중..."
  echo "START_CHARGE_THRESH_BAT0=$START_LIMIT" >>"$TLP_CONF"
  echo "STOP_CHARGE_THRESH_BAT0=$STOP_LIMIT" >>"$TLP_CONF"
fi

# tlp 서비스 활성화 및 시작
echo "TLP 서비스를 활성화하고 시작하는 중..."
systemctl enable tlp --now
systemctl start tlp

# 배터리 충전 한도 확인
echo "배터리 충전 한도가 75%에서 시작하고 80%에서 멈추도록 설정되었습니다."
tlp-stat -b
