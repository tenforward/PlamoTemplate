;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plam Linux emacs ����ե����� (ư���Ϣ)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; �������¸�Ŀ�
;(setq history-length 1000)
;;; GC �򸺤餹
;(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; yes,no �������뤫���ˡ�y,n �ˤ���
;(fset 'yes-or-no-p 'y-or-n-p)

;;; .save.. �Ȥ����ե��������ʤ�
;(setq auto-save-list-file-name nil)
;(setq auto-save-list-file-prefix nil)

;;; ~�Ĥ��ΥХå����åץե��������ʤ�
;(setq make-backup-files nil)

;;; visible-bell
;(setq visible-bell t)

;;; ��ưľ��� *scratch* buffer ������ʸ�����ʤ���
;(setq initial-scratch-message nil)

;;; startup message ��ä�
;(setq inhibit-startup-message t)

;;; gzip���줿���ܸ��info�򸫤�
(auto-compression-mode t)

;;; shell-mode �� ^M ��Ф��ʤ����롥
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;;; shell-mode �ǥѥ�������Ϥ򱣤�
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(setq comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|'s \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|^\\|\\[sudo\\] \\)�ѥ����\\|[Pp]assword\\( (again)\\)?\\|pass phrase\\|\\(Enter\\|Repeat\\|Bad\\) passphrase\\)\\(?:, try again\\)?\\(?: for [^:]+\\)?:\\s *\\'")

;;; C-x b ���䴰��������������פǤʤ���ʬ���פȤ���
(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-prompt-newbuffer nil)

;;; URL �ΰ���
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "exo-open")

