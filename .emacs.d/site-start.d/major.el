;;; text-mode
;(add-hook 'text-mode-hook
;	  '(lambda ()
;	     (turn-on-auto-fill)
;	     ))

;;; c-mode
(add-hook 'c-mode-hook
	  '(lambda ()
;;	     (c-set-style "gnu")
;;	     (c-set-style "k&r")
;;	     (c-set-style "bsd")
;;	     (c-set-style "stroustrup")
;;	     (c-set-style "whitesmith")
;;	     (c-set-style "ellemtel")
;;	     (c-set-style "linux")
	     ; �������ɲä������ˡġ�
	     ; ʸ�������ɤ���䤷�Ƥ�����¸���Ƥۤ�����硥
;;	     (my-set-file-encoding default-buffer-file-coding-system)
	     ; EUC��®������¸�����硥
	     (my-set-file-encoding-quick 'euc-japan)
	     (setq c-basic-offset 4)
;;	     (setq tab-width 4)
;;	     (setq c-auto-newline t)
             ; GNU global (���� require ɬ��)
	     ) t)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)
             ))

;;; fortran-mode
(add-hook 'fortran-mode-hook
	  '(lambda ()
	     ; �������ɲä������ˡġ�
	     ; ʸ�������ɤ���䤷�Ƥ�����¸���Ƥۤ�����硥
;;	     (my-set-file-encoding default-buffer-file-coding-system)
	     ; EUC��®������¸�����硥
	     (my-set-file-encoding-quick 'euc-japan)
	     ) t)

;;; navi2ch
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)

;;; Ruby
;(autoload 'ruby-mode "ruby-mode" "Ruby Mode" t)