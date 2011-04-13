;;; -*- Mode: Emacs-Lisp ; Coding: euc-japan -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Plamo Linux �桼������ե����륵��ץ� for Mew
;;                            Time-stamp: <2002-08-20 03:36:30 cyamauch>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plamo Linux �� Mew �����Ѥ��뤿���ɬ�פ�����Ǥ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq mew-smtp-helo-domain (getenv "HOSTNAME"))

;;; POP�ʤɤ����Ѥ�����ϡ�
;;; �ʲ��������̵���ˤ���
(setq mew-mail-domain (getenv "HOSTNAME"))
(setq mew-mailbox-type 'mbox)
(setq mew-mbox-command "incm")
;;; �ɥᥤ������ʲ������ꤷ�Ƥ���������

;;; �᡼�륢�ɥ쥹�� @ ������ʥ桼��̾�ˤ���ꤹ�롥
;(setq mew-user "hogeman")

;;; �᡼�륢�ɥ쥹�� @ �ʹߤ���ꤹ�롥
;(setq mew-mail-domain "hoge.fuga.or.jp")

;;; POP�����Ѥ����硥APOP �ξ������ꤹ��ɬ�פϤʤ���
;(setq mew-pop-auth 'pass)

;;; POP�����ФΥ�������Ȥ���ꤹ�롥
;(setq mew-pop-user "hogeman")

;;; ���Ѥ���POP�����Ф���ꤹ�롥
;(setq mew-pop-server "pop.hoge.fuga.or.jp")

;;; ���Ѥ���SMTP�����Сʥ᡼�륵���Сˤ���ꤹ�롥
;(setq mew-smtp-server "smtp.hoge.fuga.or.jp")
;;; SMTP ǧ�ڤξ�硤�桼��̾�����
;(setq mew-smtp-user "XXXX")

;;; ���������ꤹ��ɬ�פϤ���ޤ��󤬡�From: �����ܸ��
;;; ���줿�����ʤɤ˻��ꤷ�ޤ���
;;(setq mew-from "Hogeman [�ۤ��ޤ�] <hogeman@hoge.fuga.or.jp>")

;;;�ᥤ���ᥤ�륵���Ф˻Ĥ����ޤޤˤ���
;(setq mew-pop-delete nil)

;;; ML �� From: �������˥᡼�������ʤ��褦��
(setq mew-replyto-to-list '("Mail-Followup-To:" "Reply-To:"))
(setq mew-replyto-cc-list nil)

;;; POP �Ǽ�������᡼��Υ�����(54kB)��Ϥ���
;(setq mew-pop-size 0)

;;; �ѥ����(POP��PGP �ʤ�)�����Ū����¸����
(setq mew-use-cached-passwd t)

;;; ��ư���� POP �����Ф�᡼�����˹Ԥ��ʤ��褦�ˤ���
; (setq mew-auto-get nil)

;;; Summary Buffer �� i �����Ȥ��� +queue �ˤ����å�����������
; (setq mew-auto-flush-queue t)

;;; ����åɤ򸫰פ�����(t��t �ǥ���å�ɽ��)
(setq mew-use-fancy-thread t)
(setq mew-use-thread-separator t)

;;;
;(setq mew-init-hook
;      (function
;       (lambda ()
;	 (setq kill-emacs-hook (function mew-mark-process-all-folders)))))
;(setq mew-reply-to nil)

;(setq mew-cite-fields '("From:" "Subject:" "Date:" "Message-ID:"))
;(setq mew-cite-format "From: %s\nSubject: %s\nDate: %s\nMessage-ID: %s\n\n")
;(defvar mew-cite-prefix-function nil)
;;(setq mew-cite-prefix-function 'mew-cite-prefix-username)

;;; �ץ�󥿽��Ϥ�����
(setq mew-print-command-format "a2ps | lpr")
(defun mew-print-region (begin end)
  (interactive "r")
  (shell-command-on-region begin end mew-print-command-format))
(defun mew-print-buffer ()
  (interactive)
  (mew-print-region (point-min) (point-max)))
(setq mew-print-function (function mew-print-buffer))

;;; mouse ����ܥ���ǡ�URL �� Netscape ��ɽ��
(setq browse-url-browser-function 'browse-url-netscape)
(setq browse-url-netscape-program "mozilla")
(add-hook 'mew-message-mode-hook
          (function 
	   (lambda ()
	     (local-set-key [mouse-2] 'browse-url-at-mouse))))
