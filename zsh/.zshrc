# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/songzc/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf ripgrep)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#jlink
#alias fhex="JLinkExe -Device stm32f207vg -If SWD -Speed 4000"
alias fhex4="JLinkExe -Device stm32f407zg -If SWD -Speed 4000 -CommandFile /home/songzc/mnt_hitachi/songzc/codbase/stm32f4_burn.jlink"
#alias fhex1="JLinkExe -Device stm32f103c8 -If SWD -Speed 4000 -CommandFile /home/songzc/mnt_hitachi/songzc/codbase/stm32f1_burn.jlink"
alias fhex1="JLinkExe -Device stm32f107rc -If SWD -Speed 4000 -CommandFile /home/songzc/mnt_hitachi/songzc/codbase/stm32f107_burn.jlink"
#alias j4="JLinkExe -Device stm32f407zg -If SWD -Speed 4000"
#alias j1="JLinkExe -Device stm32f103c8 -If SWD -Speed 4000"
alias j1="JLinkExe -Device stm32f107rc -If SWD -Speed 4000"
alias fspine="JLinkExe -Device stm32f446rc -If SWD -Speed 4000 -CommandFile /home/songzc/mnt_hitachi/songzc/codbase/spine.jlink"

#jlinkrttlog
#alias rttlog="JLinkRTTLogger -Device stm32f407zg -If SWD -Speed 4000 -RTTChannel 0 /tmp/rtt.log"
alias rttlog="JLinkRTTLogger -Device stm32f107rc -If SWD -Speed 4000 -RTTChannel 0 /tmp/rtt.log"

hash -d src="$HOME/mnt_hitachi/songzc/codbase/"

function setmouse-ks(){
    trackball_id=`xinput list --id-only  "Kensington Expert Wireless TB Mouse"`
    xinput set-button-map ${trackball_id} 3 2 1 4 5 6 7
    xinput --set-prop $trackball_id 'libinput Accel Speed' 1 # 设置 mouse 速度 (-1.0 ~1.0)
}

function setkb-hhkb(){
    hhkb_id=`xinput list --id-only  "Topre Corporation HHKB Professional"`
    echo "thinkpad id:$hhkb_id:::"
       
    xkbcomp $HOME/.hhkb.xkb $DISPLAY -i ${hhkb_id}
}

function setkb-thinkpad(){
    thinkpad_id=`xinput list --id-only  "AT Translated Set 2 keyboard"`

    echo "thinkpad id: $thinkpad_id"
    xkbcomp $HOME/.thinkpad.xkb $DISPLAY  -i ${thinkpad_id}
}


alias setd2="xrandr --output VGA-1 --auto --left-of LVDS-1"
alias offd2="xrandr --output VGA-1 --off"

#alias setd2prs="xrandr --output VGA-1  --same-as LVDS-1 --mode "


function startprs(){
    xrandr --output LVDS-1 --mode $1
    xrandr --output VGA-1  --same-as LVDS-1 --mode $1
}


function stopprs(){
    xrandr --output LVDS-1 --auto
    xrandr --output VGA-1  --left-of LVDS-1 --auto
}

#PATH=$HOME/open_source/TaskJuggler/bin:$HOME/.local/bin:$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-8.4.3/bin:$PATH:$HOME/luactb-1.0.2:$HOME/.gem/ruby/2.7.0/bin
PATH=$HOME/open_source/TaskJuggler/bin:$PATH:$HOME/.gem/ruby/2.7.0/bin

PATH=/usr/local/Wolfram/WolframEngine/12.2/SystemFiles/Kernel/Binaries/Linux-x86-64/:$PATH

PATH=/usr/local/Wolfram/WolframEngine/12.2/Executables/:$PATH
PATH=/opt/scilab/bin/:$PATH


export PATH=/usr/bin/vendor_perl:$PATH

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH


function return-back-space(){
    sudo journalctl --vacuum-time=2d
    sudo pacman -Sc
    rm -f $HOME/.cache/ibus-table/debug.log
}


alias ssink='scrot -e "inkscape \$f" -s'

alias xmnd-recompile='env STACK_YAML=$HOME/open_source/xmonad-contrib/stack.yaml stack exec xmonad -- --recompile'

alias run-gitit='env STACK_YAML=$HOME/open_source/gitit/stack.yaml stack exec Gitit -- -f config'

#alias rm="rm-p"


#alias wolframscript='/usr/local/Wolfram/WolframEngine/12.2/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript'

########################################## AIR 800 ###############################################

air_kernel_src_version=linux-4.19.94-ti-r51
air_kernel_version=4.19.94

air_ip=192.168.56.250
#air_ip=192.168.153.20

##air_kernel_src_version=linux-5.4.66-ti-r18
##air_kernel_version=5.4.66


alias mlo='sudo dd if=$HOME/codbase/tronlong/u-boot-2019.07-rc4/MLO of=/dev/sdc count=2 seek=1 bs=128k'
alias ubo='sudo dd if=$HOME/codbase/tronlong/u-boot-2019.07-rc4/u-boot.img of=/dev/sdc count=4 seek=1 bs=384k'

#function kocp {
#     sudo mount /dev/sdc1 /mnt
#     sudo cp $HOME/codbase/tronlong/driver/ksz8795/*.ko /mnt/lib/modules/4.19.94/kernel/drivers/net/dsa/microchip/.
#     
#     sudo cp $HOME/codbase/tronlong/driver/rotary-encoder/*.ko /mnt/lib/modules/4.19.94/kernel/drivers/input/misc/.
#     sync
#     sudo umount /mnt
#}


#function kocp {
#     sudo mount /dev/sdc1 /mnt
#     sudo cp $HOME/codbase/tronlong/microchip/*.ko /mnt/lib/modules/4.19.94/kernel/drivers/net/dsa/microchip/.
#     sudo sync
#     sudo umount /mnt
#}


#function lkcp {
#    #sudo mount /dev/sdc1 /mnt
#    sudo mount /dev/sdd1 /mnt
#    sudo cp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/zImage /mnt/boot/vmlinuz-4.19.94-r43
#     sudo sync
#     sudo umount /mnt
#}
#
#
#function dtbcp {
#    #sudo mount /dev/sdc1 /mnt
#    sudo mount /dev/sdc1 /mnt
#    sudo cp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/*.dtb /mnt/boot/dtbs/4.19.94-r43/.
#    sudo sync
#    sudo umount /mnt
#}
#
#
#
#function dsacp {
#     sudo mount /dev/sdc1 /mnt
#     sudo cp $HOME/codbase/tronlong/${air_kernel_src_version}/net/dsa/*.ko /mnt/lib/modules/4.19.94/kernel/net/dsa/. 
#     sync
#     sudo umount /mnt
#}
#
#
#function rfcp {
#    kernel_version=4.19.94
#    sudo sh -c "echo 'uname_r=${kernel_version}' >> /$HOME/codbase/tronlong/rootfs/boot/uEnv.txt"
#    sudo cp -rfv  $HOME/codbase/tronlong/${air_kernel_src_version}/deploy/lib  $HOME/codbase/tronlong/rootfs
#    sudo cp $HOME/codbase/tronlong/driver/ksz8795/*.ko $HOME/codbase/tronlong/rootfs/lib/modules/4.19.94/kernel/drivers/net/dsa/microchip/.
#    sudo cp $HOME/codbase/tronlong/driver/rotary-encoder/*.ko $HOME/codbase/tronlong/rootfs/lib/modules/4.19.94/kernel/drivers/input/misc/.
#    sudo cp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/zImage $HOME/codbase/tronlong/rootfs//boot/vmlinuz-4.19.94
#    sudo cp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/*.dtb $HOME/codbase/tronlong/rootfs//boot/dtbs/4.19.94/.
#    sudo cp $HOME/codbase/tronlong/${air_kernel_src_version}/net/dsa/*.ko $HOME/codbase/tronlong/rootfs/lib/modules/4.19.94/kernel/net/dsa/.
#}


function aicp {
    cp /home/songzc/codbase/tronlong/dts-source/linux-bbai/*.dts   /home/songzc/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/.
    cp /home/songzc/codbase/tronlong/dts-source/linux-bbai/*.dtsi   /home/songzc/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/.
}


function dtbcp {
    #scp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/*.dtb root@${air_ip}:/boot/dtbs/${air_kernel_version}/.
    #scp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/am5729-beagleboneai.dtb  root@${air_ip}:/boot/dtbs/${air_kernel_version}/.
    #scp $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/am5729-beagleboneai.dtb  ubuntu@${air_ip}:/home/ubuntu/.
    sudo cp -f $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/dts/am5729-beagleboneai.dtb  /mnt/boot/dtbs/4.19.94
}

function kocp {
    scp $HOME/codbase/tronlong/driver/ksz8795/*.ko root@${air_ip}:/lib/modules/${air_kernel_version}/kernel/drivers/net/dsa/microchip/.
    scp $HOME/codbase/tronlong/driver/rotary-encoder/*.ko root@${air_ip}:/lib/modules/${air_kernel_version}/kernel/drivers/input/misc/.
    #scp $HOME/codbase/tronlong/driver/microchip/*.ko root@${air_ip}:/lib/modules/4.19.94/kernel/drivers/net/dsa/microchip/.
}


function kmcp {
    scp -r $HOME/codbase/tronlong/${air_kernel_src_version}/deploy/lib  root@${air_ip}:/
    scp -r $HOME/codbase/tronlong/${air_kernel_src_version}/arch/arm/boot/zImage root@${air_ip}:/boot/vmlinuz-${air_kernel_version}
}


function tlcp {
    scp -r $HOME/codbase/tronlong/tools/evtest  root@${air_ip}:~/.
    scp -r $HOME/codbase/tronlong/tools/devmem2  root@${air_ip}:~/.
    scp -r $HOME/codbase/tronlong/${air_kernel_src_version}/tools/spi/spi_lcd  root@${air_ip}:~/.
    scp -r $HOME/codbase/tronlong/${air_kernel_src_version}/tools/spi/spidev_test  root@${air_ip}:~/.
}

#alias pandoc='~/.stack/snapshots/x86_64-linux-tinfo6/100e055fcbdc872df6d2e9216dc3bdffc599d4aee347f7aa31f87b638c06e50b/8.6.5/bin/pandoc'

#alias llog ='date +"%Y%m%d%H%M%S" | xargs -I{} lcm-logger {}'

function llog {
    #    date +"%Y%m%d%H%M%S" | xargs -I{} lcm-logger {}
    #    date +"%H%M%S-%Y%m%d" | xargs -I{} lcm-logger {}
    date +"%H%M%S-%Y%m%d" | xargs -I{} lcm-logger  -c "(leg_control.*)|(state_.*)|(microstrain)|(wbc_lcm_data)|(main_cheetah_visualization)" {}
}


function tclog {
    #    date +"%Y%m%d%H%M%S" | xargs -I{} lcm-logger {}
    #    date +"%H%M%S-%Y%m%d" | xargs -I{} lcm-logger {}
    date +"%H%M%S-%Y%m%d" | xargs -I{} lcm-logger  -c "(leg_control.*)|(state_.*)|(microstrain)|(wbc_lcm_data)|(main_cheetah_visualization)" --lcm-url="udpm://239.255.100.100:7667?ttl=255" {}
}


alias rm='echo "This is not the command you are looking for."; false'



