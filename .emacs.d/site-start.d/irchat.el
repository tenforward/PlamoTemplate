;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; irchat
;;   IRC (����å�) ���饤����Ȥ�����
;;   M-x irchat �ǵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path
      (append '("/usr/share/emacs/site-lisp/irchat-2.4jp23b") load-path))
(autoload 'irchat "irchat" nil t)

;;; IRC server �λ���
;;; (�����줫��Ĥ򥳥��ȥ����Ȥ��ޤ�)
;;(setq irchat-server "irc.tohoku.ac.jp")
;;(setq irchat-server "irc.kyutech.ac.jp")
;;(setq irchat-server "irc.tokyo.wide.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")
;;(setq irchat-server "irc.huie.hokudai.ac.jp")
;;(setq irchat-server "irc.cc.yamaguchi-u.ac.jp")
;;(setq irchat-server "irc.karrn.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")

;;; �桼����̾�ȥ˥å��͡���
;;; (nick ��Ⱦ�ѱѿ������ []{}_\^ ����ʤ���� 9 ʸ����ʸ����Ǥ�)
(setq irchat-name "IRC sample user")
(setq irchat-nickname "PJEtest")

;;; �ǥե���Ȥǻ��ä�������ͥ�Υꥹ��
;;;  �ʤ����˽񤤤������ͥ�ˤ� irchat �ε�ư��Ʊ���˻��äǤ��ޤ���
;;(setq irchat-startup-channel-list '("#linuxjp,#pjetest"))
(setq irchat-startup-channel-list '("#pjetest"))

;;; ���ץ����
;;;   �ܺ٤� /usr/doc/irchat-2.4jp23a/FAQ-about-jp23.txt ����
(setq irchat-reconnect-automagic t)      ; �ڤ줿���˺���³���ߤ�
;;(setq irchat-channel-buffer-mode t)    ; ����ͥ�ʬ��ɽ���⡼��
;;(setq irchat-display-channel-always t)
;;(setq irchat-default-freeze-local nil)
