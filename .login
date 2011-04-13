######################################################################
# Plamo Linux �桼������ե����륵��ץ� .login
#                           Time-stamp: <2004-01-11 23:31:23 cyamauch>
#                           Time-stamp: <2009-07-09 12:21:25 tamuki>

# biff: �᡼�뤬�Ϥ���ü���˥�å�������ɽ�����ޤ���
if ( -x /usr/bin/biff ) then
  if ( -w `tty` ) then
    biff y
  endif
endif

# fortune: �������������ä���å�������ɽ�����ޤ���
if ( $SHLVL == 1 ) then
  if ( { tty --silent } ) then >& /dev/null
    if ( -x /usr/games/fortune ) then
      echo ; /usr/games/fortune ; echo
    endif
  endif
endif

# esd: ������ɥ����Ф�ư���ޤ���
if ( $SHLVL == 1 ) then
  if ( -x /usr/bin/esdctl && ! { esdctl serverinfo } ) then >& /dev/null
    if ( -x /usr/bin/esd ) then
      ( setsid esd -r 48000 & ) >& /dev/null
    endif
  endif
endif
