
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias gmake='make'

#export TEXMFCNF=/opt/context/tex/texmf-context/web2c
#export TEXMF=/opt/context/tex/texmf-context

 export TEXROOT=~/software/context/tex
# 
# # binaries & formats
 TEXMFOS=$TEXROOT/texmf-linux-64
# export TEXMFOS
# 
# # base TeX files & fonts
#  export TEXMFMAIN=$TEXROOT/texmf
# 
# # ConTeXt
#  export TEXMFCONTEXT=$TEXROOT/texmf-context
# 
# # cache for LuaTeX
#  export TEXMFCACHE=$TEXROOT/texmf-cache
# 
# # user additions or modifications
#  export TEXMFLOCAL=$TEXROOT/texmf-local
# 
# # optional (by/for Hans)
#  export TEXMFFONTS=$TEXROOT/texmf-fonts
#  export TEXMFEXTRA=$TEXROOT/texmf-extra
#  export TEXMFPROJECT=$TEXROOT/texmf-project
# 
# # the next lines fail on dec alpha os's, so there you need
# # to comment them (bug traced down by kees van marle/martin
# # corrino)
# 
# # export HOMETEXMF=/nonexist
# 
#  export TEXMFCNF="$TEXROOT/texmf{-local,-context,}/web2c"
# # export TEXMF="{$TEXMFPROJECT,$TEXMFFONTS,$TEXMFLOCAL,$TEXMFOS,$TEXMFCONTEXT,$TEXMFEXTRA,!!$TEXMFMAIN}"
#  export TEXMFDBS=$TEXMF
# 
# # export TEXFORMATS='$TEXMFOS/web2c{/$engine,}'
# # export MPMEMS=$TEXFORMATS

PAC_IGNORE_PACKS=unison,ibus,ibus-pinyin,ibus-table,amule,erlang
# ,chromium,emacs,qt,wine
PAC_IGNORE_GROUPS=gnome
#gnome,libreoffice,xfce4,qt
alias pacupg="sudo pacman -Syu --ignoregroup $PAC_IGNORE_GROUPS --ignore $PAC_IGNORE_PACKS"


export OSFONTDIR=/usr/share/fonts/adobe
#export CTXDIR=/opt/context

NDK=$HOME/software/android-ndk-r10b
ASDK=$HOME/software/android-sdk-linux/platform-tools/
export PATH=$PATH:$ASDK:$HOME/.cabal/bin:/opt/MOOS-2.3-free:$ARM_COMPILER_DIR:$NDK

#ibus setting
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export XIM=ibus
export QT_IM_MODULE=ibus
#export XIM_ARGS="ibus-daemon -d -x"
export XIM_ARGS="-d -x"

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

     
#alias rd="rdesktop  -f  -u Administrator 192.168.5.99"
alias plantuml="java -jar ~/software/plantuml.jar -tsvg"
alias tangle="~/szc_life/bin/tangle.sh"
alias emacsw="env LANG='zh_CN.utf8' LC_CTYPE='zh_CN.utf8' emacs "

#export JAVA_HOME=/usr/lib/jvm/java-10-openjdk
#export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib/
#export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

# #alias p4vw="env LANG='zh_CN' LC_CTYPE='zh_CN' ~/software/p4v-2012.3.567045/bin/p4v"
# JAVAAUTH_DIR=$HOME/project/akazam/iptv/javaAuth
# alias iptvauth="java -cp $JAVAAUTH_DIR/bin:$JAVAAUTH_DIR/lib/* auth"
# alias icm="ant clean && ant debug "
# alias iup="adb uninstall com.itv.android.iptv && adb install bin/IPTV-debug.apk"


function iac(){
    adb connect 192.168.35.$1
}

#alias iac="adb connect 192.168.35."
alias m94="sshfs songzc@192.168.35.94:/home/songzc/android/source/HiSTBAndroidV400R001C00SPC050B012/ mount"

function icw(){
    cp -f  $HOME/mount/out/target/product/godbox/obj/lib/libmywebcore.so $HOME/svn/iptv_player_new/libs/armeabi
    ant debug
    adb uninstall com.itv.android.iptv && adb install bin/IPTV-debug.apk
}

GRADLE_HOME=$HOME/software/gradle-1.11
google_tools=$HOME/software/google_depot_tools/

gem_path=$HOME/.gem/ruby/2.5.0/bin
taskjuggler=$HOME/software/TaskJuggler/bin
vscode=$HOME/software/VSCode-linux-x64
cpplint=$HOME/software/cpplint
wordnet=/usr/local/WordNet-3.0
xsde=/home/songzc/open_source/xsde-3.2.0-x86_64-linux-gnu
wps=/home/songzc/software/wps-office/
export PATH=$taskjuggler:$gem_path:$xsde/bin:$PATH:/home/songzc/software/android_ndk/bin/:$google_tools:$GRADLE_HOME/bin:$vscode/bin:$wordnet/bin:$cpplint:$wps

# dont set this Var, call " archlinux-java "
#export ANDROID_NDK_ROOT=$NDK
#export ANDROID_SDK_ROOT=$HOME/software/android-sdk-linux/

#export WINEARCH=win32



export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source /usr/bin/virtualenvwrapper.sh


#alias cnpm="npm --registry=https://registry.npm.taobao.org \
#--cache=$HOME/.npm/.cache/cnpm \
#--disturl=https://npm.taobao.org/dist \
#--userconfig=$HOME/.cnpmrc"

alias QQ="env WINEARCH=win32 wine /home/songzc/.wine/drive_c/Program\ Files/QQ/Bin/QQ.exe"


alias up1="python /home/songzc/codbase/stm32_gcc/stm32bl-master/stm32bl.py -p /dev/ttyUSB0 -b 115200 -vv -a 0x8010000 -e 4 -e 5 -e 6 -e 7 -e 8 -w /home/songzc/codbase/330/acu_app/ACUmain/acu200h.bin"


#trackball
trackball_id=`xinput list --id-only  "Kensington Kensington Slimblade Trackball"`
#xinput set-button-map ${trackball_id} 3 2 1 4 5 6 7


function setkb-thinkpad(){
    thinkpad_id=`xinput list --id-only  "AT Translated Set 2 keyboard"`

    echo "thinkpad id: $thinkpad_id"
    xkbcomp $HOME/szc_life/configure/thinkpad.xkb $DISPLAY  -i ${thinkpad_id}
}

function setkb-hhkb(){
    hhkb_id=`xinput list --id-only  "Topre Corporation HHKB Professional"`
    echo "thinkpad id:$hhkb_id:::"
       
    xkbcomp $HOME/szc_life/configure/hhkb.xkb $DISPLAY -i ${hhkb_id}
}


alias wakeup222="wol a4:1f:72:59:d1:84"
alias ssp26='ssh -t songzc@192.168.62.26 "systemctl suspend"'

#alias setd2="xrandr --output VGA1 --mode 1600x900 --left-of LVDS1"
alias setd2="xrandr --output VGA1 --auto --left-of LVDS1"
alias offd2="xrandr --output VGA1 --off"


#jlink
#alias fhex="JLinkExe -Device stm32f207vg -If SWD -Speed 4000"
alias fhex4="JLinkExe -Device stm32f407zg -If SWD -Speed 4000 -CommandFile /home/songzc/mnt_hitachi/songzc/codbase/stm32f4_burn.jlink"
alias fhex1="JLinkExe -Device stm32f103c8 -If SWD -Speed 4000 -CommandFile /home/songzc/mnt_hitachi/songzc/codbase/stm32f1_burn.jlink"

alias j4="JLinkExe -Device stm32f407zg -If SWD -Speed 4000"
alias j1="JLinkExe -Device stm32f103c8 -If SWD -Speed 4000"

#jlinkrttlog
alias rttlog="JLinkRTTLogger -Device stm32f103c8 -If SWD -Speed 4000 -RTTChannel 0 /tmp/rtt.log"

function win7() {
    ssh -t songzc@192.168.52.222 "nohub VBoxManage startvm 'win7' --type headless&"
}


export PATH="$PATH:/home/songzc/luactb-1.0.2"

