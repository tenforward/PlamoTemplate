#!/bin/sh
######################################################################
# Plamo Linux ユーザ設定ファイルサンプル for xinitrc, xsession
#                           Time-stamp: <2011-09-30 20:09:58 karma>
#                           Time-stamp: <2006-01-18 16:56:27 jado>
#                           Time-stamp: <2009-06-18 15:07:14 kojima>
#                           Time-stamp: <2009-06-22 19:24:46 tamuki>

# startx，xdm から実行されるファイルです。

#WM="step"
#WM="qvwm"
#WM="twm"
WM="xfce"
#WM="kde"

unset TERM

if [ $WM = "step" ] ; then
  xsetroot -solid white
  ini_mail=/etc/template/mime-mail.sample
  cur_mail=/var/spool/mail/$USER
  if [ -f $ini_mail -a -f $cur_mail ] ; then
    if diff $ini_mail $cur_mail > /dev/null ; then
      [ -x /usr/lib64/X11/afterstep/plamo_banner ] &&
          /usr/lib64/X11/afterstep/plamo_banner &
    fi
  fi
elif [ $WM = "qvwm" ] ; then
  xsetroot -solid black
  [ -f /usr/share/qvwm/images/logo.xpm ] &&
      qvbanner /usr/share/qvwm/images/logo.xpm &
fi

LANG=ja_JP.eucJP
export LANG

# KDE additions:
KDEDIR=/opt/kde
PATH=$PATH:/usr/lib64/qt/bin:$KDEDIR/bin

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

# 漢字入力システム kinput2 の起動
CC_DEF_PATH=$HOME/.kinput2/ccdef
export CC_DEF_PATH
[ -f $HOME/.kinput2.PID ] && rm $HOME/.kinput2.PID
[ -x /usr/bin/kinput2 ] && exec /usr/bin/kinput2 &

# 日本語入力サーバ nicolatter の起動
[ -x /usr/bin/nicolatter ] && ( sleep 15 ; /usr/bin/nicolatter ) &

# 多言語入力メソッドフレームワーク uim の起動
[ -x /usr/bin/uim-xim ] && uim-xim &
[ -x /usr/bin/uim-toolbar-gtk-systray ] && uim-toolbar-gtk-systray &

# ibus
if [ $WM != "kde" -a $WM != "gnome" -a $WM != "xfce" ] ; then
  IBUS_DAEMON=/usr/bin/ibus-daemon
  if [ -x $IBUS_DAEMON ]; then
    $IBUS_DAEMON --xim --daemonize
  fi
fi

# kinput2 を使う場合はこちら
XMODIFIERS="@im=kinput2"
# nicolatter を使う場合はこちら
#XMODIFIERS="@im=nicolatter"
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

# Wall paper
if [ $WM == "step" ] ; then
  xv +noresetroot -root -max -quit /usr/share/pixmaps/backgrounds/Plamo/plamoback_c3.png
elif [ $WM == "twm" ] ; then
  xv +noresetroot -root -quit /usr/share/pixmaps/backgrounds/Plamo/sx68k_root1.xpm
fi

# Keep Christmas!!
if [ `date +%m%d` \> "1222" -a `date +%m%d` \< "1227" ] ; then
  [ -x /usr/X11R7/bin/xsnow ] && /usr/X11R7/bin/xsnow &
fi

# unclutter は一定時間動かないカーソルを隠すプログラムです。
if [ $WM != "kde" -a $WM != "gnome" -a $WM != "xfce" ] ; then
  unclutter &
fi

# 適当な場所に kterm を開きます。
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

# ウィンドウマネージャを終了すると X が終了します。
case $WM in
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
esac

mesg y
