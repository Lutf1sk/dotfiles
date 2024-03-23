
export SDL_VIDEODRIVER=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export WLR_NO_HARDWARE_CURSORS=1
export WLR_DRM_DEVICES=/dev/dri/card0
export WLR_RENDERER_ALLOW_SOFTWARE=1

export SWAY_LOG=/tmp/sway_log

exec >$SWAY_LOG
exec 2>>$SWAY_LOG

exec sway --unsupported-gpu --verbose
