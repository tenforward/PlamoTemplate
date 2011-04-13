###################################################################
#  Plamo Linux �桼������ե����륵��ץ� .zshrc
#                       Chisato Yamauchi (cyamauch@phyas.aichi-edu.ac.jp)
#                            Time-stamp: <2005-02-02 20:10:01 cyamauch>

#if [ $SHLVL = 1 ] ; then
#  PATH="$PATH:." ;
#fi

# ü���ˤ�ä����ܸ�ɽ������/���ʤ����ڤ��ؤ�
#if [ "$TERM" = "linux" ] ; then
#  LANG=C
#else
#  LANG=ja_JP.eucJP
#fi
LANG=ja_JP.eucJP
export LANG

# JIS��ɽ���Ǥ��ʤ�ü����EUC�ˤ���
if [ "$TERM" = "xterm" -o "$TERM" = "dtterm" ] ; then
  JLESSCHARSET=japanese-euc
fi

# less �ǹ��ֹ��Ĥ�����λ��˲��̤�Ĥ�
LESS='-M -X'

EDITOR='vi'
#EDITOR='emacs -nw'
PAGER='less'
export LESS EDITOR PAGER

HISTFILE=$HOME/.zhistory

# color-ls
# ���������� ~/.dir_colors
if which dircolors >& /dev/null; then
  eval `dircolors -b ~/.dir_colors`
  LS_OPTIONS=(--color=auto -F -T 0 -N) ;
else
  LS_OPTIONS=(-F -T 0 -N) ;
fi

# Emacs �ʤɤ� dumb ü���ǤϿ���Ĥ��ʤ�
if [ "$TERM" = "dumb" ] ; then
    LS_OPTIONS=(-F -T 0 -N --color=none) ;
else
  GREP_OPTIONS="--color=auto"
  export GREP_OPTIONS
fi

export LS_OPTIONS
alias ls='/bin/ls $LS_OPTIONS';
alias dir='/bin/dir $LS_OPTIONS';
alias vdir='/bin/vdir $LS_OPTIONS';

# Window�Υ����ȥ�С��˥����ȥǥ��쥯�ȥ꤬
# ɽ���Բ�ǽ�ʾ��Υץ��ץ�����
PS1='%n@%m[%~]%# '
# kterm,xterm,rxvt �Υ����ȥ�� prompt ��ɽ������
case $TERM in
kterm|xterm|rxvt|dtterm|vt100)
    # Window�Υ����ȥ�С��˥����ȥǥ��쥯�ȥ�
    # ��ɽ����ǽ�ʾ��Υץ��ץ�����
    #   ɽ���㢪 hoge@host[/usr/X11R7/lib/X11/app-defaults]% _
    PS1='%n@%m[%~]%# '
    #   ɽ���㢪 hoge@host[app-defaults]% _
    #PS1='%n@%m[%c]%# '
    HN="`hostname`:"
#    HN="`hostname -s`:"
    case "$TERM" in
    vt*)
	HN=""
    ;;
    esac
    function mkrmhmpwd () {
	tty > /dev/null
	if [ "$?" = "0" ] ; then
	  BSBS_HOME=`echo "/$HOME"|/usr/bin/sed -e 's/\//\\\\\//g'` ;
	  RMHMPWD=`echo "/$PWD"|/usr/bin/sed -e "s/$BSBS_HOME/~/g"` ;
	  if [ "$RMHMPWD" = "/$PWD" ] ; then
	      RMHMPWD="$PWD"
	  fi
	fi
    }
    # �٤��ޥ���ǤϤ���������������������
    # function mkrmhmpwd () { RMHMPWD="$PWD" ; }
    function termtitle () {
	tty > /dev/null
	if [ "$?" = "0" ] ; then
	  if [ -w `tty` ] ; then
	    echo -ne "\033]0;$TERM - $*\007" > `tty`
	  fi
	fi
    }
    function cd () { builtin cd $* ; mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ; }
    function popd () { builtin popd $* ; mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ; }
    function pushd () { builtin pushd $* ; mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ; }
    #function pwd () { builtin pwd ; mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ; }
    function su () { mkrmhmpwd ; termtitle "$HN""su $*($RMHMPWD)" ;
	command su $* ;
	mkrmhmpwd ; 
        termtitle "$HN""[$RMHMPWD]" ; }
    function rsh () {
	termtitle "$HN""rsh $*" 
	command rsh $* 
	mkrmhmpwd ; 
	termtitle "$HN""[$RMHMPWD]"
    }
    function rlogin () { 
	termtitle "$HN""rlogin $*" 
	command rlogin $* 
	mkrmhmpwd ; 
	termtitle "$HN""[$RMHMPWD]"
    }
    function telnet () { 
	termtitle "$HN""telnet $*" 
	command telnet $* 
	mkrmhmpwd ; 
	termtitle "$HN""[$RMHMPWD]"
    }
    function ssh () { 
	termtitle "$HN""ssh $*" 
	command ssh $* 
	mkrmhmpwd ; 
	termtitle "$HN""[$RMHMPWD]"
    }
#    mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]"
;;
esac

# �ץ��ץ� PS1 �� export ���ʤ�(���bash��¹Ԥ�����Ѥˤʤ�Τ�)
typeset +x PS1
# ��¸��������ιԿ�
HISTSIZE=512
SAVEHIST=512
# �䴰�����ɽ��
setopt auto_list
# ��ʣ���륤�٥�Ȥ���¸���ʤ�
setopt hist_ignore_all_dups
# �饤�󥨥ǥ�����ǥץ��ץȤ�ɽ������ޤ��˥����å��꥿�����ɽ�����ʤ�
#unsetopt prompt_cr
# �����뤬��λ�������˥���֤ξ��֤���𤷤ʤ�
#unsetopt check_jobs
# �����뤬��λ���Ƥ⡢�¹���Υ���֤�HUP�����ʥ������ʤ�
unsetopt hup
# beep�����Ĥ餵�ʤ�
#unsetopt beep
# Ctrl+D �� exit ���ʤ�
#setopt ignoreeof
# �䴰��̵�뤹�륵�ե��å���
#fignore=('.o' '~')
# �᡼����Τ餻��
#setopt mail_warning

#emacs �饤���ʥ����Х���ɤˤ���
bindkey -e
#vi �饤���ʥ����Х���ɤˤ���
#bindkey -v

# �����դ�����ǽ�ˤ���
# PageUp,PageDown ����
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
# ��������
# �Ť� zsh �� history-search-xxxx �ˤ���
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
#bindkey "^[[A" history-search-backward
#bindkey "^[[B" history-search-forward
#bindkey "^[[A" backward-word
#bindkey "^[[B" forward-word
bindkey "^[[3~" delete-char
# Home,End ����
bindkey "^[[1~" beginning-of-history
bindkey "^[[4~" end-of-history
bindkey "^[[7~" beginning-of-history
bindkey "^[[8~" end-of-history

# ü���ˤ�� BackSpace ������Ĵ��
stty erase '^?'
case "$TERM" in
kterm|sun)
    stty erase '^H'
    bindkey "^?" delete-char
    ;;
#vt*)
#    stty erase '^H'
#    bindkey "^?" delete-char
#    ;;
esac
stty werase '^W'
# Ctrl+S �Ǥ� stop �����
stty stop undef

# aliases
alias h='history'
alias rmdvi='rm *.dvi ; rm *.log ; rm *.aux ; rm *.toc'
alias rmback='rm *~ ; rm *.bak'
alias j='jobs -l'
alias la='ls -a'
alias ll='ls -l'
alias z='suspend'
alias x='exit'
alias LS='ls -alF | command less -E'
alias mu='mule -rv'
#alias ssh1='ssh -1'
#alias scp1='scp -oProtocol=1'
#alias xv='xv -nolimits'

# csh emulation
setenv () {
    if [ $# -eq 0 ]; then
	/usr/bin/printenv
    else
	export $1=$*[2,-1]
    fi
}
alias unsetenv=unset
