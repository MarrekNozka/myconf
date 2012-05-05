setopt ALL_EXPORT
#############################################################
#    The following lines were added by compinstall
#############################################################
zstyle ':completion:*' completer _oldlist _complete _match _prefix _list _approximate
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} m:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
#zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# End of lines added by compinstall
#############################################################

#############################################################
#   automatické doplňování
#############################################################
autoload -U compinit # -z
compinit
# automatické doplňování má barvičky
zmodload -i zsh/complist
eval $(dircolors -b ~/.dir_colors) 
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


setopt nohup
#LC_MESSAGES=C

# History
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999
setopt appendhistory HIST_BEEP INC_APPEND_HISTORY
#setopt SHARE_HISTORY  
#setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt HISTIGNORESPACE        # pokud začnu příkaz mezerou neuloží se do historie
setopt HISTIGNOREALLDUPS      # příkaz je v historii jen jednou


#############################################################
# Chování příkazového řádku, vstup výstup
#############################################################
#
#bindkey -v
# chová se jako Emacs
bindkey -e
# ale když stisku Esc začnese chovat jako VI
bindkey '^[' vi-cmd-mode
bindkey ' ' magic-space    #mezerník rozbaluje odkazy na historii || also do history expansion on space
bindkey '^Z' complete-word # complete on tab, leave expansion to _expand
#
# Vi style:
autoload -U edit-command-line  
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

### Korektury při překlepu
setopt correct 			# příkaz
zstyle ':completion:*' max-errors 0 numeric
#setopt correctall 		# celý řádek
#setopt globdots		# * se chová jako * a .*
#
### zákaz korekce
alias mv='nocorrect mv'       # no spelling correction on mv
alias rm='nocorrect rm'       # no spelling correction on rm
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
# 
# bezpečné přesměrování výstupu
setopt noclobber  # >> > >! >| >>! 
# pokročílá expanze žolíkových znaků
setopt extendedglob # **/*.txt
#
setopt beep notify #un
# cd
setopt autocd # pokud napíšu jen cestu pouužije se automaticky cd
#CDPATH=".:~:~/Documents:~/Documents/SPSe"
CDPATH=".:~:~/Documents/SPSe:~/Documents/VOS"

#############################################################
###      Completion
#############################################################
setopt autonamedirs alwaystoend nomenucomplete
setopt COMPLETE_ALIASES AUTO_NAME_DIRS AUTO_PARAM_SLASH AUTO_REMOVE_SLASH 
setopt automenu autolist
setopt autoparamkeys listambiguous listbeep listpacked listtypes


#############################################################
#           Doplňování příkazu kill                         #
#############################################################
## command for process lists, the local web server details and host completion
## on processes completion complete all user processes
#zstyle ':completion:*:processes' command 'ps -au$USER'
#
### add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#
#zstyle ':completion:*:processes' command 'ps ax -o pid,s,nice,stime,args | sed "/ps/d"'
if [ $USER = root ]; then
    zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,%cpu,cmd'
else
    zstyle ':completion:*:*:kill:*:processes' command 'ps fx -o pid,user,%cpu,cmd'
fi
zstyle ':completion:*:processes-names' command 'ps axho command' 

#############################################################
#                 Prompt                                    #
#############################################################
autoload -U promptinit
promptinit; 

if [ $USER = root ]; then
#        prompt adam2 cyan red red forground;
    ZSHcol=red
else
#        prompt adam2 cyan yellow green forground;
    ZSHcol=green
fi

if [ $SSH_CLIENT ]; then 
    ZSHcol2=red
else 
    ZSHcol2=green
fi

#datum a čas
ZSHd="%b%F{yellow}%D{%a %y-%m-%d-%T}"
#tty
ZSHt="%b%F{green}%l"
RPROMPT="%B<%F{black}%!%F{default}|$ZSHd%F{default}|$ZSHt"
##########################################
#
#začátek
ZSHo="%B%F{cyan}.%2c"
ZSHo="%B%F{cyan}.%B%F{black}%?%b%F{cyan}%b%F{cyan}%(?.\<:-).\>:-\()"
# user@host
ZSHh="%B%F{forground}|%B%F{black}(%b%F{$ZSHcol}%n%B%F{black}@%b%F{$ZSHcol2}%m%B%F{black})"
# druhý řádek
ZSHz="%B%F{cyan}\`-%b%F{cyan}-%B%F{white}%B%F{forground}%(\!.##.>) %b%f%k"
ZSHk="%B%F{black}-."

##########################################
precmd () {
#konec
ZSHlen=${#${(%):-.%?.:....%n@%m...%~...}}
    if (( $ZSHlen < $COLUMNS )); then
        ZSHesc='%~'
    else 
        ZSHesc='^/%2c'
        ZSHlen=${#${(%):-.%?.:....%n@%m..../%2c...}}
        if (( $ZSHlen > $COLUMNS )); then
            ZSHesc='^/%1c'
        fi
    fi
    for ((i=0; i< $[ $COLUMNS - $ZSHlen ] ; i++)); do
        local ZSHline="-$ZSHline"
    done
    ZSHline="%b%F{cyan}$ZSHline"
####pracovní adresář
    ZSHw="%b%F{cyan}-%B%F{black}(%B%F{yellow}$ZSHesc%B%F{black})"
    PROMPT=$(print $ZSHo$ZSHh$ZSHw$ZSHline$k\\n$ZSHz)
#### MC
    if [ $ISMC ] || [ $MC_SID ]; then
        prompt walters $ZSHcol 
    fi

}

##########################################
preexec () {
    if [[ "$TERM" == "screen" ]]; then
        local CMD=${1[(wr)^(*=*|sudo|-*)]}
        echo -n "\ek$CMD\e\\"
    fi
}

#
########################################################
#PROMPT="[$(print '%{\e[1;33m%}%.%{\e[0m%}')]$ "
#RPROMPT="%B<%b$(print '%{\e[1;30m%}%h%{\e[0m%}') %T %b"
#RPROMPT="%B<%b$(print '%{\e[1;30m%}%h%{\e[0m%}') %T $(print '%{\e[1;32m%}%n%{\e[0m%}')@$(print '%{\e[1;35m%}%m%{\e[0m%}'):$(print '%{\e[1;33m%}%~%{\e[0m%}')"
#export PS1 RPS1 CDPATH

#############################################################
#     barevný grep
#############################################################
GREP_OPTIONS='--color=auto'
GREP_COLOR='1;33'
# and less
LESS='-r'


#############################################################
#              připojí aliasy a funkce 
#############################################################
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
if [ -f ~/.aliases.local ]; then
    . ~/.aliases.local
fi


#############################################################
#     Starrt terminálu, ToDo, Remind
#############################################################
if [ -z $loginsh ] && [ $USER != root ] && [ -z $NOTODO ]; then
    cat .vim/linuxlogo  
    if [ -x /usr/games/fortune ]; then
        fortune
    fi
    echo 
    uptime
    echo
#	if [ -x /usr/bin/remind ]; then
#		rem
#	fi
#    if [ -f ~/.todo ]; then
#        cat ~/.todo
#    fi
    unset loginsh
fi

#############################################################
#     Autoload zsh modules when they are referenced
#############################################################
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile
autoload zmv
#autoload -U zutil 
#autoload -U complist

#############################################################
unsetopt ALL_EXPORT

eval $(dircolors -b ~/.dir_colors) 
