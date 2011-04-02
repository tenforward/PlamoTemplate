;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plamo Linux emacs ������ե����� (�Խ���Ϣ)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; �ǽ��������μ�ư����
;;;   �ե��������Ƭ���� 8 �԰���� Time-stamp: <2011-04-02 14:40:21 karma> �ޤ���
;;;   Time-stamp: " " �Ƚ񤤤Ƥ���С������ֻ��˼�ưŪ�����դ���������ޤ�
(add-hook 'write-file-hooks 'time-stamp)

;;; �ǲ��Ԥǡ֢��פ򲡤����Ȥ����ࡼ���ʥ�������ˤ���
(setq scroll-step 1)
(setq scroll-conservatively 4)

;;; PageUp,PageDown �λ��˥���������֤��ݻ�
(setq scroll-preserve-screen-position t)

;;; �ޥ����ο�����ܥ���ǥڡ����Ȥ�����˥���������֤��ѹ����ʤ�
;(setq mouse-yank-at-point t)

;;; ��������ΰ��֤����Բ����ܤ���ɽ������
(line-number-mode t)
;(column-number-mode t)

;;; �ե졼��κ�¦�˹��ֹ�ɽ������ wb-line-number
;;; F11 ������ ON/OFF �Ǥ��ޤ���
;;; http://homepage1.nifty.com/blankspace/emacs/wb-line-number.html
(require 'wb-line-number)
(setq truncate-partial-width-windows nil)
(setq wb-line-number-scroll-bar t)
(setq wb-cursor-in-non-selected-windows nil)

;;; ��ư���Ի��ΰ�Ԥ�ʸ����
;(setq fill-column 80)

;;; �������뤬��Ƭ�ˤ���Ȥ��ˡ�C-k 1��� ���ι����Τ���
;(setq kill-whole-line t)

;;; Ĺ���Ԥ��ޤ��֤���ɽ�����ʤ�
;(set-default 'truncate-lines t)

;;; Ctrl-h �� BS ��
(global-set-key (kbd "C-h") 'delete-backward-char)

;;; ���֤�Ȥ�ʤ�
(setq-default indent-tabs-mode nil)

;;; �ޡ����ΰ���դ�
(setq transient-mark-mode t)

;;; �б������̤�ɽ��
(show-paren-mode 1)