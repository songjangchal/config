#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xss-lock -- /usr/bin/slock &

# exchange button left and button right

#trackball
trackball_id=`xinput list --id-only  "Kensington Kensington Slimblade Trackball"`
#xinput set-button-map ${trackball_id} 3 2 1 4 5 6 7
xinput --set-prop $trackball_id 'libinput Accel Speed' 1 # 设置 mouse 速度 (-1.0 ~1.0)



thinkpad_id=`xinput list --id-only  "AT Translated Set 2 keyboard"`
hhkb_id=`xinput list --id-only  "Topre Corporation HHKB Professional"`


#setxkbmap -layout us -variant dvp
xkbcomp $HOME/thinkpad.xkb $DISPLAY -i ${thinkpad_id}
xkbcomp $HOME/hhkb.xkb $DISPLAY -i ${hhkb_id}


export XMODIFIERS="@im=ibus"
#export XMODIFIERS="@im=fcitx5"
#export GTK_IM_MODULE=xim
#export QT_IM_MODULE=xim

xsetroot -cursor_name left_ptr

xrandr --output VGA-1 --auto --left-of LVDS-1
#xrandr --output VGA1 --mode 1366x768
#xrandr --output HDMI1 --mode 1600x900 --left-of  VGA1
#xrandr --output VGA1 --left-of LVDS1
#syndaemon -t -k -i 2 -d & 
#taffybar&

#stalonetray -i 16 --max-width 48 --icon-gravity E --geometry 48x16-0+0 -bg '#2e3436' --sticky --skip-taskbar &
#stalonetray -i 21  --icon-gravity E --geometry 10x1-0+0 -bg '#1B1D1E' --sticky   --dockapp-mode wmaker -d all --window-strut none  --kludges=force_icons_size&

#ibus-daemon -x -d -r
#nm-applet&

#nohup $HOME/software/davmail/davmail.sh &

#
#exec startlxde
# exec gnome-session  
exec xmonad
#export exwm_x_enable="yes"

# watch date | dzen2 -dock -p &

#exec dbus-launch --exit-with-session emacs
