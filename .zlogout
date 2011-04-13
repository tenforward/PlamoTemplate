######################################################################
# Plamo Linux ユーザ設定ファイルサンプル .zlogout
#                             Time-stamp: <2009-07-09 12:28:02 tamuki>

# esd: サウンドサーバを終了します。
if [ $SHLVL -eq 1 ] ; then
  if [ `w -h $USER | wc -l` -eq 1 ] ; then
    if [ -x /usr/bin/esd ] ; then
      killall esd &> /dev/null
    fi
  fi
fi
