#!/bin/sh
######################################################################
# Plamo Linux �桼������ե����륵��ץ� for xinitrc, xsession
#                           Time-stamp: <2005-10-28 14:45:12 cyamauch>
#                           Time-stamp: <2006-01-18 16:56:27 jado>
#                           Time-stamp: <2009-06-18 15:07:14 kojima>
#                           Time-stamp: <2009-06-22 19:24:46 tamuki>

# startx��xdm ����¹Ԥ����ե�����Ǥ���

WM="step"
#WM="qvwm"
#WM="twm"
#WM="xfce"
#WM="kde"
#WM="gnome"

unset TERM

if [ $WM == "step" ] ; then
  xsetroot -solid white
  ini_mail=/etc/template/mime-mail.sample
  cur_mail=/var/spool/mail/$USER
  if [ -f $ini_mail -a -f $cur_mail ] ; then
    if diff $ini_mail $cur_mail > /dev/null ; then
      [ -x /usr/X11R7/lib/X11/afterstep/plamo_banner ] &&
          /usr/X11R7/lib/X11/afterstep/plamo_banner &
    fi
  fi
elif [ $WM == "qvwm" ] ; then
  xsetroot -solid black
  [ -f /usr/X11R7/share/qvwm/images/logo.xpm ] &&
      qvbanner /usr/X11R7/share/qvwm/images/logo.xpm &
fi

LANG=ja_JP.eucJP
export LANG

#PATH=$HOME/bin:$PATH

# KDE additions:
KDEDIR=/opt/kde
PATH=$PATH:/usr/lib/qt/bin:$KDEDIR/bin

# Environment variables for the htdig package:
PATH=$PATH:/opt/www/htdig/bin
export KDEDIR PATH

#SHELL=/bin/tcsh
#export SHELL

userresources=$HOME/.Xdefaults
[ -f $userresources ] && xrdb -merge $userresources

# .Xmodmap(�Ѹ쥭���ܡ�����)�� CapsLock(�ѿ�)�� Ctrl �������Ѥ��������
# ����Ƥ���ޤ���
if [ "x`xmodmap -pk | grep Eisu_toggle`" == "x" ] ; then
  usermodmap=$HOME/.Xmodmap
else
  usermodmap=$HOME/.Xmodmap.jp
fi

# X�����ѻ��ˡ�Caps_Lock(�ѿ�) �� Control_L �Ȥ������ؤ������ͭ���ˤ��ޤ���
#[ -f $usermodmap ] && xmodmap $usermodmap

# �ٻ��̤ΰ��������֥����ܡ�����
#xmodmap -e 'keycode 131 = backslash underscore'

# �桼���Υۡ���ǥ��쥯�ȥ�� font ���֤����ˤϤ��Τ褦�ˤ��ޤ���
#xset +fp $HOME/lib/fonts

if [ $WM == "gnome" ] ; then
  GDK_USE_XFT=1
else
  GDK_USE_XFT=0
fi
export GDK_USE_XFT

# �������ϥ����ƥ� kinput2 �ε�ư
CC_DEF_PATH=$HOME/.kinput2/ccdef
export CC_DEF_PATH
[ -f $HOME/.kinput2.PID ] && rm $HOME/.kinput2.PID
[ -x /usr/X11R7/bin/kinput2 ] && exec /usr/X11R7/bin/kinput2 &

# �������ϥ����ƥ� skkinput �ε�ư
[ -x /usr/X11R7/bin/skkinput ] && exec /usr/X11R7/bin/skkinput &

# ���ܸ����ϥ����� nicolatter �ε�ư
[ -x /usr/X11R7/bin/nicolatter ] && ( sleep 15 ; /usr/X11R7/bin/nicolatter ) &

# ���ܸ����� IME jmode �ε�ư
[ -x /usr/bin/jmode ] && /usr/bin/jmode &

# ¿�������ϥ᥽�åɥե졼���� uim �ε�ư
[ -x /usr/bin/uim-xim ] && uim-xim &
[ -x /usr/bin/uim-toolbar-gtk-systray ] && uim-toolbar-gtk-systray &

# ¿�������ϴĶ� SCIM �ε�ư
[ -x /usr/bin/scim ] && /usr/bin/scim -d

# kinput2 ��Ȥ����Ϥ�����
XMODIFIERS="@im=kinput2"
# skkinput ��Ȥ����Ϥ�����
#XMODIFIERS="@im=skkinput"
# nicolatter ��Ȥ����Ϥ�����
#XMODIFIERS="@im=nicolatter"
# jmode ��Ȥ����Ϥ�����
#XMODIFIERS="@im=jmode"
# uim ��Ȥ����Ϥ�����
#XMODIFIERS="@im=uim"
#QT_IM_MODULE=uim
#GTK_IM_MODULE=uim
# SCIM ��Ȥ����Ϥ�����
#XMODIFIERS="@im=SCIM"
#QT_IM_MODULE=scim-bridge
#GTK_IM_MODULE=scim-bridge
export XMODIFIERS
export QT_IM_MODULE GTK_IM_MODULE

# ATOKX ���饤����Ȥε�ư
if [ -x /opt/atokx2/bin/atokx2_client.sh ] ; then
  /opt/atokx2/bin/atokx2_client.sh
elif [ -x /usr/lib/im/locale/ja/atokserver/atokx_client ] ; then
  . /usr/lib/im/locale/ja/atokserver/atokx_client
fi

# for StarSuite
USE_XOPENIM=t
export USE_XOPENIM

# obsolete setting
#UNICODEMAP_JP=cp932
#export UNICODEMAP_JP

# Environment variables for the Qt package:
#QTDIR=/usr/lib/qt
#CPLUS_INCLUDE_PATH=$QTDIR/include:$CPLUS_INCLUDE_PATH
#MANPATH="$MANPATH:/usr/lib/qt/doc/man"
#export QTDIR CPLUS_INCLUDE_PATH MANPATH

# GNOME(glib2) �����ե�����̾�Υ��󥳡��ǥ��󥰤�LANG�˹�碌�롣
G_FILENAME_ENCODING=@locale
export G_FILENAME_ENCODING

# MP3 �Υ�����ʸ�������� (�ɤ߹���: CP932 or UTF-8 / �񤭹���: CP932)
#GST_ID3_TAG_ENCODING=CP932:UTF-8
#export GST_ID3_TAG_ENCODING

# ���ꤹ��ȥ�����ɥ��ޥ͡�������ѹ���ǽ
#WINDOW_MANAGER="metacity"
#export WINDOW_MANAGER

PYTHONPATH=/usr/lib/python-2.6/site-packages:/usr/lib/python-2.6/site-packages/gtk-2.0
XDG_DATA_DIRS=/usr/share:/opt/kde/share
XDG_CONFIG_DIRS=/etc/xdg
export PYTHONPATH XDG_DATA_DIRS XDG_CONFIG_DIRS

#
# �ɻ������
#
# ���᡼����Ž���դ�����
#xv +noresetroot -root -max -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/plamoback.jpg
#xv +noresetroot -root -max -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/plamoback_c1.png
#xv +noresetroot -root -max -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/plamoback_c2.png
#xv +noresetroot -root -max -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/plamoback_c3.png
#xv +noresetroot -root -quit /usr/X11R7/lib/X11/afterstep/backgrounds/wood.jpg
#xv +noresetroot -root -quit /usr/X11R7/include/X11/pixmaps/world.xpm
#xv +noresetroot -root -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/sx68k_root1.xpm
#xv +noresetroot -root -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/sx68k_root2.xpm
# ñ�쿧�ξ��
#xsetroot -solid '#404060'
if [ $WM == "step" ] ; then
  xv +noresetroot -root -max -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/plamoback_c3.png
elif [ $WM == "twm" ] ; then
  xv +noresetroot -root -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/sx68k_root1.xpm
fi

# Keep Christmas!!
if [ `date +%m%d` \> "1222" -a `date +%m%d` \< "1227" ] ; then
  [ -x /usr/X11R7/bin/xsnow ] && /usr/X11R7/bin/xsnow &
fi

# unclutter �ϰ������ư���ʤ���������򱣤��ץ������Ǥ���
#unclutter &
if [ $WM != "kde" -a $WM != "gnome" ] ; then
  unclutter &
fi

# �᡼����Τ餻 :-9
# ��������ޥ���Υ��ס���˥᡼�뤬�������줿���Τ餻�롣
# POP/IMAP �ץ��ȥ���Ǽ�������ϻȤ��ʤ���
#xmascot -degree 15 -geometry +10+4 &
if [ $WM == "step" ] ; then
  xmascot -degree 15 -geometry +10+4 &
fi

# ���ܸ�Υ�������
#xcalendar -geometry 235x215+0+600 &

# ������ɥߥ�����
#xamixer &

# ͭ̾�� EmiClock �Ǥ���
#emiclock -geometry 140x140+662+0 &

# xipmsg �ϡ�Windows 95 & NT �� Machintosh �� IP-Messenger ��
# X window �˰ܿ�������ΤǤ���
# �����ư���Ƥ������Ȥ� Windows �� Mac �桼����
# �ꥢ�륿��������ܸ�ǥ���åȤ��������ǽ�Ǥ���
#xipmsg -name "�ϥ�ɥ�̾" &

# X Window ������������Ѥ���ʤ����ˡ�
# ������ɥ��ޥ͡���������ꤷ�������꡼�󥻡��С���ɽ������ޤ���
xset s off

# X Window ������������Ѥ���ʤ����˲��̤���å����ޤ���
#xset s noblank

# mnews �ε�ư
#kterm -km euc -sb -sl 500 -geometry 80x24+0+0 -e mnews -bg cornsilk &

# Ŭ���ʾ��� kterm �򳫤��ޤ���
#kterm -vb -km euc -geometry 80x30+10+10 -bg cornsilk &
if [ $WM == "qvwm" ] ; then
  kterm -vb -km euc -geometry 80x30+10+10 -bg cornsilk &
elif [ $WM == "twm" ] ; then
  kterm -vb -km euc -geometry 80x36+24+4 -bg cornsilk &
  kterm -vb -km euc -geometry 80x36-4+4 -bg cornsilk &
  kterm -vb -km euc -geometry 86x36+4-4 -bg cornsilk &
fi

if [ -n "`env | grep XDG_SESSION_COOKIE`" ] ; then
  LAUNCH="/usr/bin/dbus-launch --exit-with-session"
else
  LAUNCH=/usr/bin/ck-launch-session
fi

mesg n

# ������ɥ��ޥ͡������λ����� X ����λ���ޤ���
case $WM in
"step")
  exec $LAUNCH afterstep
  ;;
"qvwm")
  exec $LAUNCH qvwm
  ;;
"twm")
  exec $LAUNCH twm
  ;;
"xfce")
  exec $LAUNCH startxfce4
  ;;
"kde")
  exec $LAUNCH startkde
  ;;
"gnome")
  exec $LAUNCH gnome-session
  ;;
esac

mesg y