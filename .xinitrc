#!/bin/sh
######################################################################
# Plamo Linux ユーザ設定ファイルサンプル for xinitrc, xsession
#                           Time-stamp: <2011-04-13 18:56:13 karma>
#                           Time-stamp: <2006-01-18 16:56:27 jado>
#                           Time-stamp: <2009-06-18 15:07:14 kojima>
#                           Time-stamp: <2009-06-22 19:24:46 tamuki>

# startx，xdm から実行されるファイルです。

#WM="qvwm"
#WM="twm"
WM="xfce"
#WM="kde"

unset TERM

if [ $WM = "qvwm" ] ; then
  xsetroot -solid black
  [ -f /usr/X11R7/share/qvwm/images/logo.xpm ] &&
      qvbanner /usr/X11R7/share/qvwm/images/logo.xpm &
fi

LANG=ja_JP.eucJP
export LANG

# KDE additions:
KDEDIR=/opt/kde
PATH=$PATH:$KDEDIR/bin

# Environment variables for the htdig package:
PATH=$PATH:/opt/www/htdig/bin
export KDEDIR PATH

userresources=$HOME/.Xdefaults
[ -f $userresources ] && xrdb -merge $userresources

# .Xmodmap(英語キーボード用)に CapsLock(英数)と Ctrl を入れ変える設定を
# 入れてあります。
if [ "x`xmodmap -pk | grep Eisu_toggle`" == "x" ] ; then
  usermodmap=$HOME/.Xmodmap
else
  usermodmap=$HOME/.Xmodmap.jp
fi

# Xの利用時に，Caps_Lock(英数) と Control_L とを入れ替える時は有効にします。
#[ -f $usermodmap ] && xmodmap $usermodmap

# 漢字入力システム skkinput の起動
[ -x /usr/X11R7/bin/skkinput ] && exec /usr/X11R7/bin/skkinput &

# 多言語入力メソッドフレームワーク uim の起動
[ -x /usr/bin/uim-xim ] && uim-xim &
[ -x /usr/bin/uim-toolbar-gtk-systray ] && uim-toolbar-gtk-systray &

# skkinput を使う場合はこちら
#XMODIFIERS="@im=skkinput"
# uim を使う場合はこちら
#XMODIFIERS="@im=uim"
#QT_IM_MODULE=uim
#GTK_IM_MODULE=uim
# ibus を使う場合はこちら
XMODIFIERS="@im=ibus"
QT_IM_MODULE=ibus
GTK_IM_MODULE=ibus
export XMODIFIERS
export QT_IM_MODULE GTK_IM_MODULE

# Environment variables for the Qt package:
# QT_GRAPHICSSYSTEM: native(default)/opengl/raster
#QT_GRAPHICSSYSTEM=opengl
#export QT_GRAPHICSSYSTEM

# GNOME(glib2) が作るファイル名のエンコーディングをLANGに合わせる。
G_FILENAME_ENCODING=@locale
export G_FILENAME_ENCODING

# MP3 のタグの文字コード (読み込み: CP932 or UTF-8 / 書き込み: CP932)
#GST_ID3_TAG_ENCODING=CP932:UTF-8
#export GST_ID3_TAG_ENCODING

PYTHONPATH=/usr/lib/python-2.7/site-packages:/usr/lib/python-2.7/site-packages/gtk-2.0
XDG_DATA_DIRS=/usr/share:/opt/kde/share
XDG_CONFIG_DIRS=/etc/xdg
export PYTHONPATH XDG_DATA_DIRS XDG_CONFIG_DIRS

# Keep Christmas!!
if [ `date +%m%d` \> "1222" -a `date +%m%d` \< "1227" ] ; then
  [ -x /usr/X11R7/bin/xsnow ] && /usr/X11R7/bin/xsnow &
fi

# XTerm の起動
if [ $WM == "qvwm" ] ; then
  xterm -vb -geometry 80x30+10+10 -bg cornsilk &
elif [ $WM == "twm" ] ; then
  xterm -vb -geometry 80x36+24+4 -bg cornsilk &
  xterm -vb -geometry 80x36-4+4 -bg cornsilk &
  xterm -vb -geometry 86x36+4-4 -bg cornsilk &
fi

if [ -n "`env | grep XDG_SESSION_COOKIE`" ] ; then
  LAUNCH="/usr/bin/dbus-launch --exit-with-session"
else
  LAUNCH=/usr/bin/ck-launch-session
fi

mesg n

# ウィンドウマネージャを終了すると X が終了します。
case $WM in
"qvwm")
  exec $LAUNCH qvwm
  ;;
"xfce")
  exec $LAUNCH startxfce4
  ;;
"kde")
  exec $LAUNCH startkde
  ;;
esac

mesg y
