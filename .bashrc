###################################################################
#  Plamo Linux �桼������ե����륵��ץ� for bash
#                            Time-stamp: <2005-02-02 20:09:17 cyamauch>

# prevent illegal line wrapping
shopt -s checkwinsize

## ��������ʳ� (�����󥷥���Ǥʤ����) �ǡ�
## ���å�����ξ��˼¹Ԥ���ޤ���

if [ ! -n "$SSH_CLIENT" -o -n "$SSH_TTY" ] ; then

# �������ѿ������� (�ܺ٤� man bash)
# ��¸��������ιԿ�
HISTSIZE=512
HISTFILESIZE=512
# ����ʸ���ǻϤޤ�ԡ�����κǸ�ιԤ˥ޥå�����Ԥ�
# ���������ʤ�
HISTCONTROL=ignoreboth
# Ctrl+D �� 3 ��̵�뤹��
IGNOREEOF=3

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
LESS='-R -M -X'

EDITOR='vi'
#EDITOR='emacs -nw'
PAGER='less'
export LESS EDITOR PAGER

# if [ $SHLVL = 1 ] ; then
#   PATH="$PATH:." ;
# fi

# ls �ǿ���Ĥ���
# ���������� ~/.dir_colors
if which dircolors >& /dev/null; then
  eval `dircolors -b $HOME/.dir_colors`
  LS_OPTIONS='--color=auto -F -T 0 -N'
else
  LS_OPTIONS='-F -T 0 -N';
fi
# Emacs �ʤɤ� dumb ü���ǤϿ���Ĥ��ʤ�
if [ "$TERM" = "dumb" ] ; then
  LS_OPTIONS="-F -T 0 -N --color=none"
else
  GREP_OPTIONS="--color=auto"
  export GREP_OPTIONS
fi
export LS_OPTIONS

alias ls='ls $LS_OPTIONS'
alias dir='dir $LS_OPTIONS';
alias vdir='vdir $LS_OPTIONS';

# Window�Υ����ȥ�С��˥����ȥǥ��쥯�ȥ�
# ��ɽ���Բ�ǽ�ʾ��Υץ��ץ�����
PS1='\u@\h:\w\$ '
#PS1='\h:\w\$ '

# ü���Υ����ȥ�� prompt ��ɽ������
if [ "$TERM" = "screen" ] ; then
  SCREEN=screen@
fi
case $TERM in
kterm|xterm|rxvt|dtterm|vt100|screen)
    # Window�Υ����ȥ�С��˥����ȥǥ��쥯�ȥ�
    # ��ɽ����ǽ�ʾ��Υץ��ץ�����
    #   ɽ���㢪 hoge@host:/usr/lib64/X11/app-defaults$ _
    PS1='\u@\h:\w\$ '
    #   ɽ���㢪 hoge@host:app-defaults$ _
    #PS1='\u@\h:\W\$ '
    HN="$SCREEN`hostname`:"
    #HN="$SCREEN`hostname -s`:"
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
    function cd () {
	if [ "x.$*" = "x." ] ; then
	    builtin cd $* ;
	else
	    builtin cd "$*" ;
	fi
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ;
    }
    function popd () {
	if [ "x.$*" = "x." ] ; then
	    builtin popd $* ;
	else
	    builtin popd "$*" ;
	fi
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ;
    }
    function pushd () {
	if [ "x.$*" = "x." ] ; then
	    builtin pushd $* ;
	else
	    builtin pushd "$*" ;
	fi
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ;
    }
    #function pwd () { builtin pwd ; mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ; }
    function su () { mkrmhmpwd ; termtitle "$HN""su $*($RMHMPWD)" ;
	if [ "$1" = "-c" ] ; then command su -c "$2";
	elif [ "$2" = "-c" ] ; then command su $1 -c "$3" 
	elif [ "$3" = "-c" ] ; then command su - $2 -c "$4"
	else command su $* ; fi
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" ; }
    function rsh () {
	termtitle "$HN""rsh $*" 
	command rsh $* 
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]"
    }
    function rlogin () { 
	termtitle "$HN""rlogin $*" 
	command rlogin $* 
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]" 
    }
    function telnet () { 
	termtitle "$HN""telnet $*" 
	command telnet $* 
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]"
    }
    function ssh () { 
	termtitle "$HN""ssh $*" 
	command ssh $* 
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]"
    }
    function screen () {
	command screen $*
	mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]"
    }
#    mkrmhmpwd ; termtitle "$HN""[$RMHMPWD]"
;;
esac

# ü���ˤ��BackSpace������Ĵ��
stty erase '^?'
case "$TERM" in
kterm|sun)
    stty erase '^H'
#   ~/.inputrc �������
#   bind '"\C-?": delete-char' 
    ;;
#vt*)
#    stty erase '^H'
#    bind '"\C-?": delete-char' 
#    ;;
esac
stty werase '^W'
# Ctrl+S �Ǥ� stop �����
stty stop undef

# �����Х������������� .inputrc �⻲�Ȥ��Ƥ���������

#Aliases
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

fi

# Source global definitions
if [ -f /etc/bashrc ] ; then
  . /etc/bashrc
fi
