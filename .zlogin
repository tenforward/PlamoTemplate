######################################################################
# Plamo Linux �桼������ե����륵��ץ� .zlogin
#                           Time-stamp: <2004-01-11 23:24:19 cyamauch>
#                           Time-stamp: <2009-07-09 12:23:37 tamuki>

# biff: �᡼�뤬�Ϥ���ü���˥�å�������ɽ�����ޤ���
if [ -x /usr/bin/biff ] ; then
  if [ -w `tty` ] ; then
    biff y
  fi
fi

# fortune: �������������ä���å�������ɽ�����ޤ���
if [ $SHLVL -eq 1 ] ; then
  if [ -x /usr/games/fortune ] ; then
    echo ; /usr/games/fortune ; echo
  fi
fi

# esd: ������ɥ����Ф�ư���ޤ���
if [ $SHLVL -eq 1 ] ; then
  if [ -x /usr/bin/esdctl ] && ! esdctl serverinfo &> /dev/null ; then
    if [ -x /usr/bin/esd ] ; then
      ( setsid esd -r 48000 & ) &> /dev/null
    fi
  fi
fi
