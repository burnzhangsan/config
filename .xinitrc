#export LANG=zh_CN.UTF8
export LC_CTYPE=zh_CN.UTF8
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export DESKTOP_SESSION=plasma
#export PLASMA_USE_QT_SCALING=0
xrdb -merge ~/.Xdefaults
#exec dbus-launch --sh-syntax --exit-with-session i3
#exec xrandr --output eDP --scale 1.5x1.5
#exec ~/.config/polybar/launch.sh
aria2c -D
exec dbus-launch --sh-syntax --exit-with-session startplasma-x11
