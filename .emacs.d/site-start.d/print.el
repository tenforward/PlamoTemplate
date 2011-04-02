;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plamo Linux emacs ������ե����� (�ץ�󥿴�Ϣ)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; �ץ�󥿽�������
(setq ps-multibyte-buffer 'non-latin-printer)
(require 'ps-mule)
;; Emacs-21�ΥХ�(?)�к�
(defalias 'ps-mule-header-string-charsets 'ignore)
;; �����ॹ�����ɽ����Ĵ���ʤ�
(add-hook 'ps-print-hook
	  '(lambda ()
	     ;; �ץ�󥿽��ϤΥ��ޥ�ɤ����
;	     (setq ps-lpr-command "lpr")
;	     (setq ps-printer-name-option "-P")
	     ;; �ץ��̾
;	     (setq ps-printer-name "lp")
;	     (setq ps-line-number t)
	     (load "time-stamp")
	     (setq ps-right-header
		   (list "/pagenumberstring load"
			 'time-stamp-yyyy/mm/dd
			 'time-stamp-hh:mm:ss))))

;(add-hook 'ps-print-hook
;          '(lambda ()
;             (setq ps-font-info-database
;                   (append
;                    '((Japanese                        ; the family key
;                       (fonts (normal      . "Ryumin-Light")
;                              (bold        . "GothicBBB-Bold")
;                              (italic      . "GothicBBB-Bold")
;                              (bold-italic . "Ryumin-Light"))
;                       (size . 10.0)
;                       (line-height . 10.27)
;                       (space-width . 5.99993)
;                       (avg-char-width . 5.99993)))
;                    ps-font-info-database))
;             (setq ps-multibyte-buffer 'non-latin-printer)
;             (setq ps-paper-type 'a4)
;             (setq ps-print-control-characters nil)
;             (setq ps-font-family 'Japanese)
;             (setq ps-font-size '(10 . 10))
;             (setq ps-print-only-one-header t) ))
