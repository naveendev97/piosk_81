sleep 5

xset s off
xset s noblank
xset -dpms

unclutter -idle 0.5 -root &

pkill chromium

rm -rf ~/.config/chromium/

chromium-browser \
  $(jq -r '.urls | map(.url) | join(" ")' ~/piosk/config.json) \
  --kiosk \
  --fast \
  --fast-start \
  --no-first-run \
  --noerrdialogs \
  --disable-infobars \
  --ozone-platform=wayland \
  --enable-features=OverlayScrollbar \
  --enable-accelerated-video-decode \
  --enable-gpu-rasterization \
  --enable-oop-rasterization \
  --ignore-gpu-blocklist \
  --disable-smooth-scrolling \
  --disable-low-res-tiling \
  --enable-low-end-device-mode \
  --disable-composited-antialiasing \
  --start-maximized \
  --incognito \
