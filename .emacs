;;; -*- Mode: Emacs-Lisp ; Coding: euc-japan -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Plamo Linux �桼������ե����륵��ץ� for emacs(mule)
;;            adjusted by M.KOJIMA, Chisato Yamauchi
;;                            Time-stamp: <2007-08-20 20:55:48 kojima>
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plamo Linux �� Emacs 21 (Mule) �����Ѥ��뤿���ɬ�פ�����Ǥ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ���ܸ�Ķ� for Emacs21
(set-language-environment "Japanese")

(set-default-coding-systems 'euc-japan)
;;; ����ǰʲ������ꤵ��ޤ���
;(setq default-buffer-file-coding-system 'euc-japan)
;(setq default-process-coding-system '(euc-japan . euc-japan))

(setq file-name-coding-system 'euc-japan)

;;; �����ߥʥ�⡼�ɤǻ��Ѥ������ɽ����ʸ�������ɤ����ꤷ�ޤ���
(if (or (equal (getenv "TERM") "dtterm") (equal (getenv "TERM") "xterm") )
    ;; dtterm, Konsole(xterm) �ξ��
    (set-terminal-coding-system 'euc-japan)
  ;; ����¾��ü���ξ��
  (set-terminal-coding-system 'iso-2022-jp))

;;; �����ߥʥ�⡼�ɤǻ��Ѥ�����Υ�������ʸ�������ɤ����ꤷ�ޤ���
(set-keyboard-coding-system 'euc-japan)

;;; ���ܸ��˥塼��ʸ��������
(setq menu-coding-system 'euc-japan)

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

;;; ��˥塼�С������ܸ�ˤ��ޤ�
(if (equal (substring (concat (getenv "LANG") "__") 0 2) "ja")
    (load "menu-tree"))

;;; X��ο��դ����ɼ�ˤ��뤫�ɤ���(1:on 0:off)
(setq window-system-global-font-lock-mode 1)
;;; ü����Ǥο��դ����ɼ�ˤ��뤫�ɤ���(1:on 0:off)
(setq terminal-global-font-lock-mode 0)

(if (eq window-system 'x)
    (global-font-lock-mode window-system-global-font-lock-mode)
  (global-font-lock-mode terminal-global-font-lock-mode))

;;; X �� Mule ������
(if (eq window-system 'x)
    (progn
      ;;; ��������С�
      (set-scroll-bar-mode 'right)
      ;; ���顼ɽ��
      (if (eq global-font-lock-mode nil)
	  (progn
	    (setq hilit-mode-enable-list  nil
		  hilit-background-mode   'light
		  ;;hilit-background-mode   'dark
		  hilit-inhibit-hooks     nil
		  hilit-inhibit-rebinding nil)
	    (require 'hilit19)
	    ))
      (cond
       ;;; Emacs-21 ��ͭ������
       ((>= emacs-major-version 21)
        ;;; ������������Ǥ����ʤ�
        ;(blink-cursor-mode nil)
        ;;; ��������Ǥϥ�������ɽ���򤷤ʤ�
        ;(setq cursor-in-non-selected-windows nil)
        ;;; �ե���ȤΥ�������֥�򤷤ʤ�
        ;(setq scalable-fonts-allowed nil)
        ;;; tool-bar ��ä�
        ;(tool-bar-mode nil)
        ;;; �ġ���С���shadow��margin������
        ;;; (�ǥե���Ȥˤ��Ƥ����ʤ���Mew�λ��ε�ư����:-P)
        ;(setq tool-bar-button-relief 3)
        ;(setq tool-bar-button-margin 1)
        ;;; �Դ֤�����
        ;(set-default 'line-spacing 1)
	;;; �ۥ�����ޥ�����ͭ���ˤ���
	(mouse-wheel-mode)
	)))
  ;;; mule/emacs -nw �ǵ�ư������������
  (progn
    ;;; ��˥塼�С���ä�
    ;(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
    ))

;;; �ǽ��������μ�ư����
;;;   �ե��������Ƭ���� 8 �԰���� Time-stamp: <> �ޤ���
;;;   Time-stamp: " " �Ƚ񤤤Ƥ���С������ֻ��˼�ưŪ�����դ���������ޤ�
(add-hook 'write-file-hooks 'time-stamp)

;;; �ޡ����ΰ���դ�
(setq transient-mark-mode t)

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

;;; ��ư���Ի��ΰ�Ԥ�ʸ����
;(setq fill-column 80)

;;; �������뤬��Ƭ�ˤ���Ȥ��ˡ�C-k 1��� ���ι����Τ���
;(setq kill-whole-line t)

;;; Ĺ���Ԥ��ޤ��֤���ɽ�����ʤ�
;(set-default 'truncate-lines t)

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

;;; ���ơ������饤��˻��֤�ɽ������
(setq display-time-24hr-format t)
(setq display-time-format "%m/%d(%a) %R")
(setq display-time-day-and-date t)
(setq display-time-interval 30)
(display-time)

;;; namazu.el ������
(autoload 'namazu "namazu.el" nil t)
(setq browse-url-browser-function 'browse-url-netscape)
(setq namazu-default-dir "/usr/var/namazu/index")

;;; JG ������
;(load "jg")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-10
;;   Mule ��β�̾�����Ѵ������ƥ� SKK ������
;;   C-x t �ǥ��塼�ȥꥢ�뤬��ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'skk-setup)

;;;;;;;;;; ���Ѥ��뼭������� ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L ��������ɤ߹�������Ѥ�����
;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M ��������ɤ߹��ߡ�
;;; ���դ���ʤ����� skkserv ��ư���� SKK-JISYO.L ���鸡��������
;;; (skkexdic �ѥå�������ɬ�פǤ�)
;;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.M")
(setq load-path
      (append '("/usr/share/emacs/site-lisp/skk")
	      load-path))
; (setq skk-aux-large-jisyo "/usr/share/skk/SKK-JISYO.L")
(setq skk-server-portnum 1178)
(setq skk-server-host "localhost")
; (setq skk-server-prog "/usr/libexec/skkserv")
(setq skk-kutouten-type 'en)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(autoload 'skk-mode "skk" nil t)
(autoload 'skk-auto-fill-mode "skk" nil t)
(autoload 'skk-tutorial "skk-tut" nil t)
(autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
(autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
(add-hook 'isearch-mode-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-setup) ))))
(add-hook 'isearch-mode-end-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-cleanup)
			   (skk-set-cursor-color-properly) ))))
(add-hook 'skk-load-hook '(lambda ()
;         (setq skk-use-color-cursor nil)
;         (setq skk-henkan-face nil)
          (skk-make-face 'Yellow/Blue)
          (setq skk-henkan-face 'Yellow/Blue)
;         (skk-make-face 'DimGray/PeachPuff1)
;         (setq skk-henkan-face 'DimGray/PeachPuff1)
   ) t)

; skk-tutorial
(defvar skktut-j-mode-map nil
  "SKK ���塼�ȥꥢ�뤫��/���ʥ⡼�ɥ����ޥå�" )

(or skktut-j-mode-map
    (let ((map (make-sparse-keymap)))
      (substitute-key-definition 'self-insert-command 'skk-insert map
                                 global-map)
      (substitute-key-definition 'egg-self-insert-command 'skk-insert map
                                 global-map)
      (substitute-key-definition 'canna-self-insert-command 'skk-insert map
                                 global-map)
      (substitute-key-definition 'can-n-egg-self-insert-command 'skk-insert map
                                 global-map)
      (define-key map "x" 'skk-previous-candidate)
      (define-key map "\C-j" 'skk-kakutei)
      (define-key map "\t" 'skk-insert)
      (setq skktut-j-mode-map map) ))

(skk-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tamago-4 ������ (Plamoɸ��)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; �����
(setq emacs-ime "default")

;; ����δĶ����� Tamago-4 �˰ܹԤ�����ϡ�
;; ~/.eggrc �������Ƥ���������

;;; Canna ��Ȥ����Ϥ������ͭ���ˤ���
(setq emacs-ime "canna")

;;; Wnn ��Ȥ����Ϥ������ͭ���ˤ���
;(setq emacs-ime "wnn")

;;  Wnn �ξ��� 2 �Ĥ����ϥ⡼��(EggRemix or Egg)�����٤ޤ�
;;; Tamago �����ϥ⡼�ɤ� Egg ReMix �ˤ���
(setq egg-mode-preference "remix")
;;; Tamago �����ϥ⡼�ɤ� �̾�� Egg �ˤ���
;(setq egg-mode-preference "egg")

;; ���Τ������ 21.3/lisp/language/japan-util.el �򻲾�
(defun its-han-katakana ()
  (interactive)
  (its-convert (lambda (str lang) (japanese-hankaku str))))

(defun its-zen-katakana ()
  (interactive)
  (its-convert (lambda (str lang) (japanese-hiragana str)))
  (its-convert (lambda (str lang) (japanese-katakana str))))

;;; Tamago-4 �ζ��̤Υ������ޥ���(egg-cnv.el�򻲾�)
(defun customize-tamago ()
  ;; �Ѵ����˲����˸����ɽ��(�����ǲ����˸���ɽ�����뤫����ޤ�)��
  (setq egg-conversion-auto-candidate-menu 1)
  ;; �Ѵ����˸�����̤��������ɽ�����롥
;  (setq egg-conversion-auto-candidate-menu-show-all t)
  ;; ����ɽ�������������뤤�ϥ���ե��٥åȤ����Ϥ��������ǳ���ˤ��롥
  (setq menudiag-select-without-return t)
  ;; �������������ϼ���ʸ��˰�ư
  (setq egg-conversion-stay-after-validate nil)
  ;; "." �ǡ֡��ס�"," �ǡ֡��פ����ϡ�
;  (setq its-hira-period "��")
;  (setq its-hira-comma  "��")
  (setq its-hira-enable-double-n t)
  (setq its-hira-open-bracket "��")
  (setq its-hira-close-bracket "��")
  (setq its-hira-horizontal  "��")
  ;; �����Х����
  (define-key egg-conversion-map "\C-g" 'egg-abort-conversion)
  (define-key egg-conversion-map "\C-s" 'ignore)
  (define-key egg-conversion-map "\C-r" 'ignore)
  (define-key egg-conversion-map "\M-a" 'ignore)
  (define-key egg-conversion-map "\M-b" 'ignore)
  (define-key egg-conversion-map "\M-d" 'ignore)
  (define-key egg-conversion-map "\M-e" 'ignore)
  (define-key egg-conversion-map "\M-f" 'ignore)
  (define-key egg-conversion-map "\M-g" 'ignore)
  (define-key egg-conversion-map "\M-m" 'ignore)
  (define-key egg-conversion-map "\M-y" 'ignore)
  (define-key egg-conversion-map "\M-t" 'ignore)
  (define-key egg-conversion-map "\M-^" 'ignore)
  (define-key egg-conversion-map "\M-{" 'ignore)
  (define-key egg-conversion-map "\M-}" 'ignore)
  (define-key egg-conversion-map "\M-`" 'ignore)
  (define-key egg-conversion-map "\M-;" 'ignore)
  (define-key egg-conversion-map "\M-:" 'ignore)
  (define-key egg-conversion-map [next] 'egg-next-candidate)
  (define-key egg-conversion-map [prior] 'egg-previous-candidate)
  (define-key egg-conversion-map [home] 'egg-beginning-of-conversion-buffer)
  (define-key egg-conversion-map [end]  'egg-end-of-conversion-buffer)
  ;(define-key egg-conversion-map "\C-k" 'egg-shrink-bunsetsu-major)
  ;(define-key egg-conversion-map "\C-l" 'egg-enlarge-bunsetsu-major)
  (define-key menudiag-mode-map [next] 'menudiag-next-line)
  (define-key menudiag-mode-map [prior] 'menudiag-previous-line)
  (define-key menudiag-mode-map [home] 'menudiag-beginning-of-items)
  (define-key menudiag-mode-map [end] 'menudiag-end-of-items)
  (define-key menudiag-mode-map "\C-x" 'menudiag-forward-item)
  (if (eq window-system 'x)
      (progn
	(define-key egg-conversion-map [C-home] 'egg-beginning-of-conversion-buffer)
	(define-key egg-conversion-map [C-end]  'egg-end-of-conversion-buffer)
	(define-key egg-conversion-map [C-delete] 'egg-abort-conversion)
	(define-key egg-conversion-map [C-backspace] 'egg-abort-conversion)
	(define-key egg-conversion-map [muhenkan] 'egg-abort-conversion)
	(define-key egg-conversion-map [hiragana-katakana] 'egg-hiragana)
	(define-key egg-conversion-map [(shift hiragana-katakana)] 'egg-katakana)
	(define-key egg-conversion-map [f6] 'egg-hiragana)
	(define-key egg-conversion-map [f7] 'egg-katakana)
	(define-key egg-conversion-map [henkan] 'egg-next-candidate)
	(define-key egg-conversion-map [kanji] 'egg-next-candidate)
	(define-key egg-conversion-map [(shift left)] 'egg-shrink-bunsetsu-major)
	(define-key egg-conversion-map [(shift right)] 'egg-enlarge-bunsetsu-major)
	(define-key egg-conversion-map [M-right] 'egg-enlarge-bunsetsu-major)
	(define-key egg-conversion-map [M-left] 'egg-shrink-bunsetsu-major)
	(define-key menudiag-mode-map [C-home] 'menudiag-beginning-of-items)
	(define-key menudiag-mode-map [C-end] 'menudiag-end-of-items)
	(define-key menudiag-mode-map [backspace] 'menudiag-exit-one-level)
	(define-key menudiag-mode-map [muhenkan] 'menudiag-exit)
	(define-key menudiag-mode-map [hiragana-katakana] 'menudiag-exit)
	(define-key menudiag-mode-map [henkan] 'menudiag-forward-item)
	(define-key menudiag-mode-map [kanji] 'menudiag-forward-item)
	(define-key menudiag-mode-map [(shift hiragana-katakana)] 'menudiag-exit)
	(define-key menudiag-mode-map [f6] 'menudiag-exit)
	(define-key menudiag-mode-map [f7] 'menudiag-exit)
	(define-key menudiag-mode-map [f8] 'menudiag-exit)
	(define-key menudiag-mode-map [(shift down)] 'menudiag-next-line)
	(define-key menudiag-mode-map [(shift up)] 'menudiag-previous-line)
	)
    (progn
      (define-key egg-conversion-map "\e[17~" 'egg-hiragana)
      (define-key egg-conversion-map "\e[18~" 'egg-katakana)
      (define-key egg-conversion-map "\e\e[C" 'egg-enlarge-bunsetsu-major)
      (define-key egg-conversion-map "\e\e[D" 'egg-shrink-bunsetsu-major)
      (define-key egg-conversion-map "\e\eOC" 'egg-enlarge-bunsetsu-major)
      (define-key egg-conversion-map "\e\eOD" 'egg-shrink-bunsetsu-major)
      (define-key menudiag-mode-map [8] 'menudiag-exit-one-level)
      (define-key menudiag-mode-map "\e[17~" 'menudiag-exit)
      (define-key menudiag-mode-map "\e[18~" 'menudiag-exit)
      (define-key menudiag-mode-map "\e[19~" 'menudiag-exit)
      ))
  ;; �Ѵ���Υޥ�������ػ�
  (if (eq window-system 'x)
      (progn
	(add-hook 'mouse-leave-buffer-hook
		  '(lambda ()
		     (if (or (its-in-fence-p) (egg-conversion-fence-p))
			 (delete-other-windows))))
	(define-key egg-conversion-map [mouse-1] 'ignore)
	(define-key egg-conversion-map [up-mouse-1] 'ignore)
	(define-key egg-conversion-map [down-mouse-1] 'ignore)
	(define-key egg-conversion-map [drag-mouse-1] 'ignore)
	(define-key egg-conversion-map [double-mouse-1] 'ignore)
	(define-key egg-conversion-map [triple-mouse-1] 'ignore)
	(define-key egg-conversion-map [M-mouse-1] 'ignore)
	(define-key egg-conversion-map [M-up-mouse-1] 'ignore)
	(define-key egg-conversion-map [M-down-mouse-1] 'ignore)
	(define-key egg-conversion-map [M-drag-mouse-1] 'ignore)
	(define-key egg-conversion-map [M-double-mouse-1] 'ignore)
	(define-key egg-conversion-map [M-triple-mouse-1] 'ignore)
	(define-key egg-conversion-map [mouse-2] 'ignore)
	(define-key egg-conversion-map [up-mouse-2] 'ignore)
	(define-key egg-conversion-map [down-mouse-2] 'ignore)
	(define-key egg-conversion-map [drag-mouse-2] 'ignore)
	(define-key egg-conversion-map [double-mouse-2] 'ignore)
	(define-key egg-conversion-map [triple-mouse-2] 'ignore)
	(define-key egg-conversion-map [M-mouse-2] 'ignore)
	(define-key egg-conversion-map [M-up-mouse-2] 'ignore)
	(define-key egg-conversion-map [M-down-mouse-2] 'ignore)
	(define-key egg-conversion-map [M-drag-mouse-2] 'ignore)
	(define-key egg-conversion-map [M-double-mouse-2] 'ignore)
	(define-key egg-conversion-map [M-triple-mouse-2] 'ignore)
	(define-key egg-conversion-map [mouse-3] 'ignore)
	(define-key egg-conversion-map [up-mouse-3] 'ignore)
	(define-key egg-conversion-map [down-mouse-3] 'ignore)
	(define-key egg-conversion-map [drag-mouse-3] 'ignore)
	(define-key egg-conversion-map [double-mouse-3] 'ignore)
	(define-key egg-conversion-map [triple-mouse-3] 'ignore)
	(define-key egg-conversion-map [M-mouse-3] 'ignore)
	(define-key egg-conversion-map [M-up-mouse-3] 'ignore)
	(define-key egg-conversion-map [M-down-mouse-3] 'ignore)
	(define-key egg-conversion-map [M-drag-mouse-3] 'ignore)
	(define-key egg-conversion-map [M-double-mouse-3] 'ignore)
	(define-key egg-conversion-map [M-triple-mouse-3] 'ignore)
	(define-key egg-conversion-map [mouse-4] 'ignore)
	(define-key egg-conversion-map [mouse-5] 'ignore)
	(define-key egg-conversion-map [S-mouse-4] 'ignore)
	(define-key egg-conversion-map [S-mouse-5] 'ignore)
	(define-key egg-conversion-map [C-mouse-4] 'ignore)
	(define-key egg-conversion-map [C-mouse-5] 'ignore)
	))
  ;;; remix �ʳ�(egg-canna,egg-wnn)�ξ�������
  (if (not (and (equal egg-mode-preference "remix") (equal emacs-ime "wnn")))
      (progn
	;; �����Х����
	(defun egg-f6-mode ()
	  (interactive)
	  (if (eq inactivate-current-input-method-function 'egg-mode)
	      (if egg-modefull-mode
		  (its-select-hiragana))))
	(defun egg-f7-mode ()
	  (interactive)
	  (if (eq inactivate-current-input-method-function 'egg-mode)
	      (if egg-modefull-mode
		  (its-select-katakana))))
	(defun egg-f8-mode ()
	  (interactive)
	  (if (eq inactivate-current-input-method-function 'egg-mode)
	      (if egg-modefull-mode
		  (its-select-hankaku-katakana))))
	(defun egg-hankaku-downcase-mode ()
	  (interactive)
	  (if (eq inactivate-current-input-method-function 'egg-mode)
	      (if egg-modefull-mode
		  (its-select-downcase))))
	(defun egg-zenkaku-downcase-mode ()
	  (interactive)
	  (if (eq inactivate-current-input-method-function 'egg-mode)
	      (if egg-modefull-mode
		  (its-select-zenkaku-downcase))))
	(define-key its-mode-map "\C-s" 'ignore)
	(define-key its-mode-map "\C-r" 'ignore)
	(define-key its-mode-map "\M-a" 'ignore)
	(define-key its-mode-map "\M-b" 'ignore)
	(define-key its-mode-map "\M-d" 'ignore)
	(define-key its-mode-map "\M-e" 'ignore)
	(define-key its-mode-map "\M-f" 'ignore)
	(define-key its-mode-map "\M-g" 'ignore)
	(define-key its-mode-map "\M-m" 'ignore)
	(define-key its-mode-map "\M-r" 'ignore)
	(define-key its-mode-map "\M-y" 'ignore)
	(define-key its-mode-map "\M-t" 'ignore)
	(define-key its-mode-map "\M-^" 'ignore)
	(define-key its-mode-map "\M-{" 'ignore)
	(define-key its-mode-map "\M-}" 'ignore)
	(define-key its-mode-map "\M-`" 'ignore)
	(define-key its-mode-map "\M-;" 'ignore)
	(define-key its-mode-map "\M-:" 'ignore)
	(define-key its-mode-map [up] 'its-hiragana)
	(define-key its-mode-map [down] 'its-katakana)
	(define-key its-mode-map [next] 'its-kick-convert-region)
	(define-key its-mode-map [prior] 'its-kick-convert-region)
	(define-key its-mode-map [home] 'its-beginning-of-input-buffer)
	(define-key its-mode-map [end]  'its-end-of-input-buffer)
	(define-key its-mode-map "\C-p" 'its-hiragana)
	(define-key its-mode-map "\C-y" 'its-hiragana)
	(define-key its-mode-map "\C-n" 'its-katakana)
	(if (eq window-system 'x)
	    (progn
	      (global-set-key [f6] 'egg-f6-mode)
	      (global-set-key [hiragana-katakana] 'egg-f6-mode)
	      (global-set-key [f7] 'egg-f7-mode)
	      (global-set-key [(shift hiragana-katakana)] 'egg-f7-mode)
	      (global-set-key [f8] 'egg-f8-mode)
	      (global-set-key [(ctrl muhenkan)] 'egg-hankaku-downcase-mode)
	      (global-set-key [(shift muhenkan)] 'egg-zenkaku-downcase-mode)
	      (global-set-key [muhenkan] 'egg-f6-mode)
	      (define-key its-mode-map [M-up] 'its-hiragana)
	      (define-key its-mode-map [M-down] 'its-katakana)
	      (define-key its-mode-map [M-left] 'ignore)
	      (define-key its-mode-map [M-right] 'ignore)
	      (define-key its-mode-map [muhenkan] 'its-exit-mode)
	      (define-key its-mode-map [C-backspace] 'its-delete-backward-SYL)
	      (define-key its-mode-map [C-delete] 'its-delete-backward-SYL)
	      (define-key its-mode-map [C-home] 'its-beginning-of-input-buffer)
	      (define-key its-mode-map [C-end]  'its-end-of-input-buffer)
	      (define-key its-mode-map [f6] 'its-hiragana)
	      (define-key its-mode-map [f7] 'its-zen-katakana)
	      (define-key its-mode-map [f8] 'its-han-katakana)
	      (define-key its-mode-map [henkan] 'its-kick-convert-region)
	      (define-key its-mode-map [kanji] 'its-kick-convert-region)
	      (define-key its-mode-map [hiragana-katakana] 'its-hiragana)
	      (define-key its-mode-map [(shift hiragana-katakana)] 'its-katakana)
	      ;(define-key its-mode-map [muhenkan] 'its-hiragana)
	      )
	  (progn
	    (global-set-key "\e[17~" 'egg-f6-mode)
	    (global-set-key "\e[18~" 'egg-f7-mode)
	    (global-set-key "\e[19~" 'egg-f8-mode)
	    (define-key its-mode-map "\e[17~" 'its-hiragana)
	    (define-key its-mode-map "\e[18~" 'its-zen-katakana)
	    (define-key its-mode-map "\e[19~" 'its-han-katakana)
	    ))
	;; �Ѵ���Υޥ�������ػ�
	(if (eq window-system 'x)
	    (progn
	      (define-key its-mode-map [mouse-1] 'ignore)
	      (define-key its-mode-map [up-mouse-1] 'ignore)
	      (define-key its-mode-map [down-mouse-1] 'ignore)
	      (define-key its-mode-map [drag-mouse-1] 'ignore)
	      (define-key its-mode-map [double-mouse-1] 'ignore)
	      (define-key its-mode-map [triple-mouse-1] 'ignore)
	      (define-key its-mode-map [M-mouse-1] 'ignore)
	      (define-key its-mode-map [M-up-mouse-1] 'ignore)
	      (define-key its-mode-map [M-down-mouse-1] 'ignore)
	      (define-key its-mode-map [M-drag-mouse-1] 'ignore)
	      (define-key its-mode-map [M-double-mouse-1] 'ignore)
	      (define-key its-mode-map [M-triple-mouse-1] 'ignore)
	      (define-key its-mode-map [mouse-2] 'ignore)
	      (define-key its-mode-map [up-mouse-2] 'ignore)
	      (define-key its-mode-map [down-mouse-2] 'ignore)
	      (define-key its-mode-map [drag-mouse-2] 'ignore)
	      (define-key its-mode-map [double-mouse-2] 'ignore)
	      (define-key its-mode-map [triple-mouse-2] 'ignore)
	      (define-key its-mode-map [M-mouse-2] 'ignore)
	      (define-key its-mode-map [M-up-mouse-2] 'ignore)
	      (define-key its-mode-map [M-down-mouse-2] 'ignore)
	      (define-key its-mode-map [M-drag-mouse-2] 'ignore)
	      (define-key its-mode-map [M-double-mouse-2] 'ignore)
	      (define-key its-mode-map [M-triple-mouse-2] 'ignore)
	      (define-key its-mode-map [mouse-3] 'ignore)
	      (define-key its-mode-map [up-mouse-3] 'ignore)
	      (define-key its-mode-map [down-mouse-3] 'ignore)
	      (define-key its-mode-map [drag-mouse-3] 'ignore)
	      (define-key its-mode-map [double-mouse-3] 'ignore)
	      (define-key its-mode-map [triple-mouse-3] 'ignore)
	      (define-key its-mode-map [M-mouse-3] 'ignore)
	      (define-key its-mode-map [M-up-mouse-3] 'ignore)
	      (define-key its-mode-map [M-down-mouse-3] 'ignore)
	      (define-key its-mode-map [M-drag-mouse-3] 'ignore)
	      (define-key its-mode-map [M-double-mouse-3] 'ignore)
	      (define-key its-mode-map [M-triple-mouse-3] 'ignore)
	      (define-key its-mode-map [mouse-4] 'ignore)
	      (define-key its-mode-map [mouse-5] 'ignore)
	      (define-key its-mode-map [S-mouse-4] 'ignore)
	      (define-key its-mode-map [S-mouse-5] 'ignore)
	      (define-key its-mode-map [C-mouse-4] 'ignore)
	      (define-key its-mode-map [C-mouse-5] 'ignore)
	      ))
	))
  )

;;; ����ʤΥ������ޥ���
(defun customize-egg-canna ()
  (add-hook 'egg-mode-hook 
	    '(lambda ()
	       ;; default.kpdef �ˤǤ��������¤�
	       (its-defrule "{"  "��" nil t)
	       (its-defrule "}"  "��" nil t)
	       (its-defrule "~"  "��" nil t)
	       (its-defrule "@-"  "��" nil t)
	       (its-defrule "@@"  "��" nil t)
	       (its-defrule "@/"  "��" nil t)
	       (its-defrule "@\\" "��" nil t)
	       (its-defrule "@,"  "��" nil t)
	       (its-defrule "@."  "��" nil t)
	       (its-defrule "@~"  "��" nil t)
	       (its-defrule "@|"  "��" nil t)
	       (its-defrule "@||" "��" nil t)
	       (its-defrule "@3"  "��" nil t)
	       (its-defrule "@2"  "��" nil t)
	       (its-defrule "@("  "��" nil t)
	       (its-defrule "@)"  "��" nil t)
	       (its-defrule "@["  "��" nil t)
	       (its-defrule "@]"  "��" nil t)
	       (its-defrule "@{"  "��" nil t)
	       (its-defrule "@}"  "��" nil t)
	       ;; �ʲ��Ͼ���ʳ�ĥ
	       (its-defrule "@?"  "��" nil t)
	       (its-defrule "@|||" "��" nil t)
	       (its-defrule "@`"  "��" nil t)
	       (its-defrule "@="  "��" nil t)
	       (its-defrule "@:"  "��" nil t)
	       (its-defrule "@*"  "��" nil t)
	       (its-defrule "@^"  "��" nil t)
	       (its-defrule "@~~" "��" nil t)
	       ))
  ;; ��������
  (define-key its-mode-map "\C-h" 'its-delete-backward-SYL)
  (define-key egg-conversion-map "\C-h" 'egg-abort-conversion)
  (define-key menudiag-mode-map "\C-h" 'menudiag-exit-one-level)
  (cond ((eq window-system 'x)
	 (define-key its-mode-map [backspace] 'its-delete-backward-SYL)
	 (define-key its-mode-map [delete] 'its-delete-SYL))
	((null window-system)
	 (define-key its-mode-map [8] 'its-delete-backward-SYL)
	 (define-key egg-conversion-map [?\177] 'egg-abort-conversion)
	 (define-key menudiag-mode-map [?\177] 'menudiag-exit-one-level)
	 (define-key its-mode-map "\e[3~" 'its-delete-SYL)
	 (if (or (equal (getenv "TERM" ) "kterm")
;		 (equal (getenv "TERM" ) "xterm")
		 (equal (getenv "TERM" ) "sun")
		 ;; TeraTerm�� DEL by Delete key �ξ���ͭ���ˤ���
;		 (equal (substring (concat (getenv "TERM") "__") 0 2) "vt")
		 )
	     (define-key its-mode-map [8] 'its-delete-SYL)
	   ))))

;;; Wnn�Υ������ޥ���
(defun customize-egg-wnn ()
  ;; ��������
  (cond ((eq window-system 'x)
	 )
	((null window-system)
	 (define-key its-mode-map "\e[3~" 'its-delete-backward-SYL)
	 )))

;;; Egg ReMix �Υ������ޥ���
(defun customize-egg-remix ()
  ;; ��������
  (if (equal egg-mode-preference "remix")
      (progn
	(define-key remix-its-mode-map "\C-p" 'remix-hiragana)
	(define-key remix-its-mode-map "\C-n" 'remix-katakana)
	(define-key remix-its-mode-map "\C-s" 'ignore)
	(define-key remix-its-mode-map "\M-<" 'ignore)
	(define-key remix-its-mode-map "\M-a" 'ignore)
	(define-key remix-its-mode-map "\M-b" 'ignore)
	(define-key remix-its-mode-map "\M-d" 'ignore)
	(define-key remix-its-mode-map "\M-e" 'ignore)
	(define-key remix-its-mode-map "\M-f" 'ignore)
	(define-key remix-its-mode-map "\M-g" 'ignore)
	(define-key remix-its-mode-map "\M-m" 'ignore)
	(define-key remix-its-mode-map "\M-r" 'ignore)
	(define-key remix-its-mode-map "\M-y" 'ignore)
	(define-key remix-its-mode-map "\M-t" 'ignore)
	(define-key remix-its-mode-map "\M-^" 'ignore)
	(define-key remix-its-mode-map "\M-{" 'ignore)
	(define-key remix-its-mode-map "\M-}" 'ignore)
	(define-key remix-its-mode-map "\M-`" 'ignore)
	(define-key remix-its-mode-map "\M-;" 'ignore)
	(define-key remix-its-mode-map "\M-:" 'ignore)
	(define-key remix-its-mode-map [up] 'remix-hiragana)
	(define-key remix-its-mode-map [down] 'remix-katakana)
	(define-key remix-its-mode-map [next] [32])
	(define-key remix-its-mode-map [prior] [32])
	(define-key remix-its-mode-map [home] 'remix-beginning-of-input-buffer)
	(define-key remix-its-mode-map [end]  'remix-end-of-input-buffer)
	(cond ((eq window-system 'x)
	       ;; �Ѵ���Υޥ�������ػ�
	       (add-hook 'mouse-leave-buffer-hook
			 '(lambda ()
			    (if (remix-in-fence-p)
				(delete-other-windows))))
	       (define-key remix-its-mode-map [mouse-1] 'ignore)
	       (define-key remix-its-mode-map [up-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [down-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [drag-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [double-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [triple-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [M-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [M-up-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [M-down-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [M-drag-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [M-double-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [M-triple-mouse-1] 'ignore)
	       (define-key remix-its-mode-map [mouse-2] 'ignore)
	       (define-key remix-its-mode-map [up-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [down-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [drag-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [double-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [triple-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [M-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [M-up-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [M-down-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [M-drag-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [M-double-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [M-triple-mouse-2] 'ignore)
	       (define-key remix-its-mode-map [mouse-3] 'ignore)
	       (define-key remix-its-mode-map [up-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [down-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [drag-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [double-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [triple-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [M-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [M-up-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [M-down-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [M-drag-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [M-double-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [M-triple-mouse-3] 'ignore)
	       (define-key remix-its-mode-map [mouse-4] 'ignore)
	       (define-key remix-its-mode-map [mouse-5] 'ignore)
	       (define-key remix-its-mode-map [S-mouse-4] 'ignore)
	       (define-key remix-its-mode-map [S-mouse-5] 'ignore)
	       (define-key remix-its-mode-map [C-mouse-4] 'ignore)
	       (define-key remix-its-mode-map [C-mouse-5] 'ignore)
	       ;; ��������
	       (define-key remix-its-mode-map [M-up] 'remix-hiragana)
	       (define-key remix-its-mode-map [M-down] 'remix-katakana)
	       (define-key remix-its-mode-map [M-right] 'ignore)
	       (define-key remix-its-mode-map [M-left] 'ignore)
	       (define-key remix-its-mode-map [C-home] 'remix-beginning-of-input-buffer)
	       (define-key remix-its-mode-map [C-end]  'remix-end-of-input-buffer)
	       (define-key remix-its-mode-map [C-backspace] 'remix-delete-backward)
	       (define-key remix-its-mode-map [C-delete] 'remix-delete)
	       ;(define-key remix-its-mode-map [delete] 'remix-delete)
	       (define-key remix-its-mode-map [henkan] [32])
	       (define-key remix-its-mode-map [hiragana-katakana] 'remix-select-kana)
	       (define-key remix-its-mode-map [(shift hiragana-katakana)] 'remix-select-nokana)
	       (define-key remix-its-mode-map [muhenkan] 'remix-exit-mode)
	       ;(define-key remix-its-mode-map [muhenkan] 'remix-select-nokana)
	       (define-key remix-its-mode-map [f6] 'remix-hiragana)
	       (define-key remix-its-mode-map [f7] 'remix-katakana)
	       (define-key remix-its-mode-map [f9] 'remix-full-width)
	       (define-key remix-its-mode-map [f10] 'remix-select-nokana))
	      ((null window-system)
	       (define-key remix-its-mode-map "\e[17~" 'remix-hiragana)
	       (define-key remix-its-mode-map "\e[18~" 'remix-katakana)
	       (define-key remix-its-mode-map "\e[20~" 'remix-full-width)
	       (define-key remix-its-mode-map "\e[21~" 'remix-select-nokana)
	       (define-key remix-its-mode-map "\e[3~" 'remix-delete-backward)
	       )))))

;;; Tamago-4 ��������

;;; Ⱦ��/���ѥ����Ǥ��Ѵ��򳫻ϤǤ���褦�ˤ���
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
(define-key isearch-mode-map [zenkaku-hankaku] 'isearch-toggle-input-method)
(define-key global-map [M-zenkaku-hankaku] 'toggle-input-method)
(define-key isearch-mode-map [M-zenkaku-hankaku] 'isearch-toggle-input-method)
(define-key global-map [kanji] 'toggle-input-method)
(define-key isearch-mode-map [kanji] 'isearch-toggle-input-method)
(define-key global-map [M-kanji] 'toggle-input-method)
(define-key isearch-mode-map [M-kanji] 'isearch-toggle-input-method)
;;; 
;;; ������ egg-toroku-region
(defun egg-f4-mode (start end &optional nth-backend)
  (interactive "r\nP")
  (if (not (eq inactivate-current-input-method-function 'egg-mode))
      (progn
	(activate-input-method default-input-method)
	(inactivate-input-method)))
  (egg-toroku-string (buffer-substring start end) nil nil nil nil nth-backend))
;;; F4 �����������ΰ��ñ����Ͽ
(if (eq window-system 'x)
    (progn
      (global-set-key [f4] 'egg-f4-mode)
      )
  (progn
    (global-set-key "\e[14~" 'egg-f4-mode)
    ))
;;;
(if (equal emacs-ime "canna")
    ;;;;;; ����ʤ�����
    (progn
      ;;; �����Фλ��ꡣ
      (setq canna-hostname "localhost")
      ;;; InputMethod ������
      (setq default-input-method "japanese-egg-canna") 
      ;;; emcws ��CANNA�Υ��ޥ�ɤ�Ȥ�
      (add-hook 'canna-load-hook '(lambda () 
				    (load "egg-canna")
				    (customize-tamago)
				    (customize-egg-canna)))
      ;;; Ctrl + o �Ǥ�Ȥ���褦�ˤ���
      (define-key global-map "\C-o" 'toggle-input-method)
      (define-key isearch-mode-map "\C-o" 'isearch-toggle-input-method)
      ;;; �ե��󥯥���󥭡��ޤ��� emcws ��Ʊ���ˤ���
      (defun canna-f1-mode ()
	(interactive)
	(if (not (eq inactivate-current-input-method-function 'egg-mode))
	    (progn
	      (activate-input-method default-input-method)
	      (inactivate-input-method)))
	(canna-kigou-mode))
      (defun canna-f3-mode ()
	(interactive)
	(if (not (eq inactivate-current-input-method-function 'egg-mode))
	    (progn
	      (activate-input-method default-input-method)
	      (inactivate-input-method)))
	(canna-bushu-mode))
      (defun canna-f12-mode ()
	(interactive)
	(if (not (eq inactivate-current-input-method-function 'egg-mode))
	    (progn
	      (activate-input-method default-input-method)
	      (inactivate-input-method)))
	(canna-extend-mode))
      (if (eq window-system 'x)
	  (progn
	    (global-set-key [f1] 'canna-f1-mode)
	    (global-set-key [f3] 'canna-f3-mode)
	    (global-set-key [f12] 'canna-f12-mode)
	    ;;; ������face��Ĥ���
	    (make-face 'canna-face)
	    (make-face 'canna-conversion-face)
	    ;;; face�����ʿ�
	    (set-face-foreground 'canna-face "darkblue")
	    (set-face-foreground 'canna-conversion-face "white")
	    ;;; face���طʿ�
	    (set-face-background 'canna-face "lightcyan1")
;	    (set-face-bold-p 'canna-conversion-face t)
;	    (set-face-inverse-video-p 'canna-conversion-face t)
	    (set-face-background 'canna-conversion-face "royalblue")
	    ;;; ������Ĥ���
	    (set-face-underline 'canna-face t)
;	    (set-face-underline 'canna-conversion-face t)
	    ;;; egg-canna�ǤĤ���face������
	    (setq its-fence-face 'canna-face)
	    (setq egg-conversion-face 'canna-conversion-face)
;	    (setq its-fence-invisible t)
;	    (setq egg-conversion-fence-invisible t)
	    ;; �Ѵ����Υ������������
	    (add-hook 'egg-enter/leave-fence-hook
		      '(lambda () 
			 (if (its-in-fence-p)
			     (progn
			       (setq cursor-type 'bar))
			   (if (egg-conversion-fence-p)
			       (progn
				 (setq cursor-type 'box)
				 (set-cursor-color "thistle1"))
			     (progn
			       (setq cursor-type 'box)
			       (set-cursor-color "black"))
			     ))))
	    )
	(progn
	  (global-set-key "\e[11~" 'canna-f1-mode)
	  (global-set-key "\e[13~" 'canna-f3-mode)
	  (global-set-key "\e[24~" 'canna-f12-mode)))
      )
  (if (equal emacs-ime "wnn")
      ;;;;;; Wnn ������
      (progn
	;;; ���ɥѥ�������
	(setq load-path (cons (expand-file-name "/usr/share/emacs/site-lisp/egg-remix") load-path))
	;;; �����Фλ��ꡣ
	(setq wnn-jserver "localhost")
	(add-hook 'wnn-load-hook '(lambda () 
				    (customize-tamago)
				    (customize-egg-wnn)))
	;;; ������face��Ĥ���
	(make-face 'remix-face)
	;;; face�����ʿ�
	(set-face-foreground 'remix-face "blue") 
	;;; face���طʿ�
	(set-face-background 'remix-face "lightskyblue") 
	;;; ������Ĥ���
	(set-face-underline 'remix-face t) 
	;;; remix�ǤĤ���face������
	(setq remix-fence-face 'remix-face) 
	;;; ���ѥ���ե��٥åȤ�ե��󥹤����Ϥ��ʤ�
	(setq its-enable-fullwidth-alphabet nil) 
	;;; �Ѵ��⡼�ɤǸ���򥵥�����å�������
	(setq egg-conversion-wrap-select t) 
	(load "egg-remix") 
	(customize-egg-remix)
	))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ����ʤ�����(emcws)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (and (boundp 'CANNA) CANNA) ; �ؤ����/emacs�٤Ǥ��뤳�Ȥ��ǧ
    (progn
      (load-library "canna")
      (canna)

      (setq canna-use-color t)


      (global-set-key "\C-_" 'canna-undo)  ;����ɥ������ꡣ
      (setq canna-save-undo-text-predicate ;����ɥ��Хåե����������
	    '(lambda (s) (> (length (car s)) 2)) )
      (setq canna-undo-hook ;����ɥ��ܦ���
            '(lambda () (message "���Ѵ����ޤ�....")                          
               (canna-do-function canna-func-henkan)) )

      ;;����ʤ��Ѵ���� BS & DEL ��Ȥ�
      ;;(define-key canna-mode-map [backspace] [?\C-h])
      ;;(define-key canna-mode-map [delete] [?\C-h])
      
      ;;����ʤ��Ѵ���� C-h ��Ȥ� (with term/keyswap)
      ;;(define-key canna-mode-map [?\177] [?\C-h])
      
      ;; BS,Delete ����������
      (cond ((eq window-system 'x)
	     (define-key canna-mode-map [delete] [?\C-d])
	     (define-key canna-mode-map [backspace] [?\C-h])
	    )
	    ((null window-system)
	     (define-key canna-mode-map [?\177] [?\C-r])
	     (if (or (equal (getenv "TERM" ) "kterm")
;		     (equal (getenv "TERM" ) "xterm")
		     (equal (getenv "TERM" ) "sun")
		     ;; TeraTerm�� DEL by Delete key �ξ���ͭ���ˤ���
;		     (equal (substring (concat (getenv "TERM") "__") 0 2) "vt")
		     )
		 (define-key canna-mode-map [8] [?\C-d])
	       )
	     ))
      ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Egg (Wnn �ե��ȥ����) ������(emcws)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (and (boundp 'WNN) WNN) ; ��Wnn/emacs�٤Ǥ��뤳�Ȥ��ǧ
    (progn

      ;; jserver ��ư���Ƥ���ۥ��Ȥ����
      (set-wnn-host-name "localhost")

      ;; "nn" �ǡ֤�פ�����
      (setq enable-double-n-syntax t)

      ;; "." �ǡ֡��ס�"," �ǡ֡��פ����ϡ� 
      ;;(setq use-kuten-for-period nil)
      ;;(setq use-touten-for-comma nil)

      ;; 1234567890%#%"' ���Ⱦ�ѡפ�����"
      (let ((its:*defrule-verbose* nil))
	(its-define-mode "roma-kana")
	(dolist (symbol '("1" "2" "3" "4" "5" 
			  "6" "7" "8" "9" "0"
			  "#" "%" "\"" "'" ))
		(its-defrule symbol symbol)))

      ;; ���ޤ� :-)
      ;;(set-egg-fence-mode-format "��" "��" 'highlight)
      
      ;; ���ޤ����Σ�
      ;; egg-mix �����ꡣegg-mix ���Τ� contrib/Working �ˤ���ޤ�
      ;; (require 'egg-mix)

      ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atok for X ������
;;  IIIMP ��ͳ�Ǽ¹Ԥ��ޤ�
;; (�� MULE-UCS, IIIMECF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;(setq emacs-ime (getenv "EMACS_IME"))     ;; �Ķ��ѿ� EMACS_IME �˽���
;
; �ʲ�����ʬ����Ƭ�Υ��ߥ����򳰤���IIIME��ͳ��ATOKX���Ȥ��ޤ���
;
;(setq emacs-ime "atokx")                  ;; atokx ��Ȥ�
;(if (or (equal emacs-ime "atokx")
;	(equal emacs-ime "atok")
;	)
;    (progn
;      
;      (require 'un-define)      
;      (setq coding-category-utf-8 'utf-8)
;      
;      (setq iiimcf-server-control-hostlist '("localhost"))
;      (setq iiimcf-server-control-default-language "ja")
;      (setq default-input-method 'iiim-server-control)
;      (require 'iiimcf-sc)
;      
;      (define-key global-map "\C-\\" 'toggle-input-method)
;      (setcar default-mode-line-format "")
;      )
;  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tm
;;  Tools for MIME ������
;;  (mew �� tm �ʤ��Ǥ� MIME ���б����Ƥ��ޤ�)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load "mime-setup")

;; tm �ˤ� tl (Tiny Library) ���ޤޤ�Ƥ��ޤ�
;; ���Τ褦�ˤ��� load-path �ɲä�ưŪ�˹Ԥ����Ȥ��Ǥ��ޤ�
;(load "tl-misc")
;(require 'file-detect)
;(add-path (get-latest-path "yatex"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNUS
;;   NetNews �꡼���� GNUS
;;   M-x gnus �ǵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path
      (append '("/usr/share/emacs/21.3/lisp/gnus")
	      load-path))
;; News Server ̾��ɥᥤ��̾����ꤷ�Ƥ�������
(setq gnus-nntp-server "news.hoge.hoge.or.jp")
(setq gnus-local-domain "hoge.hoge.or.jp")
(setq gnus-local-organization "HogeHoGe Org.")
(setq gnus-use-generic-from t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mew
;;   �᡼��꡼���� Mew
;;   M-x mew �ǵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �ʲ��ϴ���Ū����������Ǥ���
;; �᡼�륢�ɥ쥹��������ϡ�~/.mew.el �˽񤤤Ƥ���������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;;; ��������Υǥ��쥯�ȥ�
(setq mew-icon-directory "/usr/share/emacs/site-lisp/mew/etc") 

(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX
;;   [La]TeX ���ϥ⡼��
;;   M-x yatex �Ȥ��뤫��.tex �ǽ����ե�������ɤ߹���ȵ�ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path
      (append '("/usr/share/emacs/site-lisp/yatex") load-path))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)

;; *.tex *.html �γ�ĥ�Ҥ���ĥե�����򳫤�����硤
;; ���줾�� yatex-mode, yahtml-mode �ˤ��롥
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode)
	    auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "\\.html$" 'yahtml-mode)
	    auto-mode-alist))

(setq YaTeX-kanji-code 3)	; EUC�ˤ���
(setq yahtml-kanji-code 3)	; EUC�ˤ���
(setq yahtml-www-browser "firefox")
(setq tex-command "platex")
(setq dviprint-from-format "-p %b")
(setq dviprint-to-format "-l %e")
(setq dviprint-command-format "dvips %f %t -f %s | lpr")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule ��� dic �����Ѥ��뤿�������Ǥ�
;;   ~/lib/emacs �� /usr/doc/dic/eldic.el �򥳥ԡ�����
;;   dic-shell-file-name ���դ��Ŭ�ڤ����ꤷ�Ƥ���������
;;   C-c C-c C-e �Ǳ��¡�C-c C-c C-j ���±Ѥ������ޤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)

;;;
;;; emacs-20 �����ܸ�� man �򸫤�
;;;
(if (and (= emacs-major-version 20)
         (not (string-match "xemacs" emacs-version)))
    (add-hook 'Man-cooked-hook
              (lambda ()
                (goto-char (point-min))
                (while (search-forward-regexp "\222.-" nil t)
                  (delete-backward-char 1)
                  (insert "\255"))
                (goto-char (point-min))
                (while (re-search-forward "\\(.\\)\\(\b\b\\1\\)+" nil t)
                  (replace-match "\\1")
                  (if Man-fontify-manpage-flag
                      (put-text-property (match-beginning 0) (point)
                                         'face Man-overstrike-face)))
                )))

;;; F9 �����Ǹ��ߤΥ���������֤ˤ���饤�֥�ꥳ����� man �ڡ�����ɽ��
(cond ((eq window-system 'x)
       (global-set-key [(f9)] (lambda () (interactive) (manual-entry (current-word)))))
      ((null window-system)
       (global-set-key "\e[20~" (lambda () (interactive) (manual-entry (current-word))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TiMidity interface for Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'timidity "timidity" "TiMidity Interface" t)
(setq timidity-prog-path "/usr/bin/timidity")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ����¾������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; �ޥ��������ѥ����ɲ�
;;; ~/lib/emacs �ʲ��˥桼���Ѥ� *.el, *.elc ���֤����Ȥ��Ǥ��ޤ�
;;(setq load-path (append '("~/lib/emacs") load-path))

;;; C-h �� Del �������ؤ�
;;; Help �� Shift + Ctrl + h ����� Del �˳����Ƥ�졢
;;; ����ʸ������� Ctrl + h �˳����Ƥ��ޤ�
;;(load-library "term/keyswap")
;;(if (eq window-system 'x)
;;    (progn
;;      (define-key function-key-map [delete] [8])
;;      (put 'delete 'ascii-character 8)))


;;; BS,Delete �ʤɤ��ü쥭��������
;;  �Ȥˤ�����
;;   ��Delete�ϡָ��ߤΰ�ʸ���õ��
;;   ��BackSpace�ϡָ����
;;  �ˤ�����äƤߤޤ�����
;;  Windows ���ü�����ߥ�졼�� TeraTerm �������㤬
;;  ���θ�ˤ���ޤ���
;;  TeraTerm �� �����ܡ��ɤ������ DEL by �� Backspace key
;;  �˳����Ƥ뤳�Ȥ򤪴��ᤷ�ޤ���
;;

(global-set-key [end]  'end-of-buffer)
(global-set-key [home] 'beginning-of-buffer)
(cond ((eq window-system 'x)
;       (global-set-key [insert] 'set-mark-command )
       (global-set-key [8] 'delete-backward-char)
       (global-set-key [delete] 'delete-char)
       (global-set-key [(control next)] 'scroll-other-window)
       (global-set-key [(control prior)] 'scroll-other-window-down)
       (global-set-key [eisu-toggle] 'ignore)
       )
      ((null window-system)
       (global-set-key "\eOp" "0" )
       (global-set-key "\eOq" "1" )
       (global-set-key "\eOr" "2" )
       (global-set-key "\eOs" "3" )
       (global-set-key "\eOt" "4" )
       (global-set-key "\eOu" "5" )
       (global-set-key "\eOv" "6" )
       (global-set-key "\eOw" "7" )
       (global-set-key "\eOx" "8" )
       (global-set-key "\eOy" "9" )
       (global-set-key "\eOo" "/" )
       (global-set-key "\eOQ" "/" )
       (global-set-key "\eOj" "*" )
       (global-set-key "\eOR" "*" )
       (global-set-key "\eOm" "-" )
       (global-set-key "\eOS" "-" )
       (global-set-key "\eOk" "+" )
       (global-set-key "\eOl" "+" )
       (global-set-key "\eOn" "." )
       (global-set-key "\eOM" [13] )
;       (global-set-key "\e[1~" 'beginning-of-buffer )
;       (global-set-key "\e[4~" 'end-of-buffer )
       (global-set-key "\eOH" 'beginning-of-buffer )	; xterm
       (global-set-key "\e[H" 'beginning-of-buffer )	; xterm
       (global-set-key "\eOF" 'end-of-buffer )		; xterm
       (global-set-key "\e[F" 'end-of-buffer )		; xterm
;       (global-set-key "\e[2~" 'set-mark-command )	; Insert Key
       (global-set-key "\C-_" 'undo )
       ;; kon��linuxü����delete����
       (global-set-key "\e[3~" 'delete-char)
       (global-set-key [8] 'delete-backward-char)
       (if (or (equal (getenv "TERM" ) "kterm")
;	       (equal (getenv "TERM" ) "xterm")
	       (equal (getenv "TERM" ) "sun")
	       ;; TeraTerm�� DEL by Delete key �ξ���ͭ���ˤ���
;	       (equal (substring (concat (getenv "TERM") "__") 0 2) "vt")
	       )
	   (progn
             ;; keyswap �� obsolete �ˤʤä������ʤΤǡ�
	     ;; (load "term/keyswap")
	     (keyboard-translate ?\C-h ?\C-?)
	     ;; (keyboard-translate ?\C-? ?\C-h)
             (define-key function-key-map [delete] [8])
             (put 'delete 'ascii-character 8)
             ;; �����ɬ�פ��ɤ���ʬ����ʤ�
	     (if (not (equal (getenv "TERM" ) "xterm"))
		 (global-set-key [8] 'delete-char))
	     )
	 )
       ))

;;  ��TeraTermPro �� KEYBOARD.CNF ������ˤĤ��ơ�
;; /usr/doc/emacs-21.3/TeraTerm/ �� KEYBOARD.CNF �����äƤ��ޤ���
;; ����KEYBOARD.CNF ��Ȥ��ȡ�[Home][End][Delete][PageUp]��
;; �ʤɤ����ѤǤ����ƥ󥭡����Լ�ͳ�ʤ��Ȥ��������ˤʤ�ޤ���

;;; ����Ū������
;;  Esc�����ڡ��� �ǥޡ������å�
(global-set-key "\e " 'set-mark-command)
(global-set-key "\M-/" 'help-for-help)
(global-set-key "\M-?" 'help-for-help)
(global-set-key "\M-g" 'goto-line)

;;; for glibc2.1 ���ܸ� locale
;;; thanks to �ֹ⤵��
;;; Emacs20.5 �Ǥ�����
;
; (let ((lang (or (getenv "LC_ALL")(getenv "LC_TIME")(getenv "LANG"))))
;   (cond
;    ((and lang (string-match "^ja" lang))
;     (setq dired-move-to-filename-regexp
;           " [1 ][0-9]�� [0-3 ][0-9]�� +[0-9][0-9][:0-9][0-9][0-9ǯ] "))))

;;;
;;; �ե졼��κ�¦�˹��ֹ�ɽ������ wb-line-number
;;; F11 ������ ON/OFF �Ǥ��ޤ���
;;; http://homepage1.nifty.com/blankspace/emacs/wb-line-number.html
;;;
(require 'wb-line-number)
(setq truncate-partial-width-windows nil)
(setq wb-line-number-scroll-bar t)
(setq wb-cursor-in-non-selected-windows nil)
;;
;; fix to use with sdic
;;
;; utility function
(defun next-window-nondedicated (&optional WINDOW MINIBUF ALL-FRAMES)
  (let ((win (next-window WINDOW MINIBUF ALL-FRAMES)))
    (while (window-dedicated-p win)
      (setq win (next-window-nondedicated win MINIBUF ALL-FRAMES)))
    win))
(eval-after-load "sdic"
  '(defun sdic-display-buffer (&optional start-point)
     "�������ɽ���Хåե���ɽ������ؿ�"
     (let ((old-buffer (current-buffer)))
       (unwind-protect
           (let* ((buf (set-buffer sdic-buffer-name))
                  (w1 (selected-window))
                  (w2 (get-buffer-window buf))
                  (p (or start-point (point)))
                  (h sdic-window-height))
             (if w2 (progn (select-window w2) (setq h (window-height w2)))
               (setq w2 (select-window (if (one-window-p)
                                           (split-window w1 (- (window-height) h))
                                         (next-window-nondedicated))))  ;; altered
               (set-window-buffer w2 buf))
             (set-window-start w2 p)
             (and sdic-warning-hidden-entry
                  (> p (point-min))
                  (message "�������ˤ⥨��ȥ꤬����ޤ���"))
             (goto-char p)
             (if sdic-disable-select-window (select-window w1))
             (buffer-size))
         (set-buffer old-buffer)))))
;;
;; fix to use with yatex
;;
(eval-after-load "yatexlib"
  '(progn
     (defadvice YaTeX-window-list (after wb-line-number-adv-aft-YaTeX-window-list)
       (let ((l ad-return-value))
         (while l
           (and (window-dedicated-p (car l))
                (setq ad-return-value (delete (car l) ad-return-value)))
           (setq l (cdr l)))))
     (ad-enable-regexp   "^wb-line-number-adv-aft-YaTeX-window-list")
     (ad-activate-regexp "^wb-line-number-adv-aft-YaTeX-window-list")))
;;
;;
(cond ((eq window-system 'x)
       (global-set-key [f11] 'wb-line-number-toggle))
      ((null window-system)
       (global-set-key "\e[23~" 'wb-line-number-toggle)))
;;
(add-hook 'wb-line-number-before-enable-hook
	  '(lambda ()
	     (setq wb-bak-scroll-bar-mode scroll-bar-mode)
	     (set-scroll-bar-mode nil)
	     (cond
	      ((>= emacs-major-version 21)
	       (setq wb-bak-cursor-in-non-selected-windows
		     cursor-in-non-selected-windows)
	       (setq cursor-in-non-selected-windows
		     wb-cursor-in-non-selected-windows)
	       ))
	     ))
(add-hook 'wb-line-number-after-disable-hook
	  '(lambda ()
	     (set-scroll-bar-mode wb-bak-scroll-bar-mode)
	     (cond
	      ((>= emacs-major-version 21)
	       (setq cursor-in-non-selected-windows
		     wb-bak-cursor-in-non-selected-windows)
	       ))
	     ))

;; ���������ơ��֥��ɽ��
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d  0x%02x  %c\n" i i i))))
  (beginning-of-buffer))

;; �Хåե��� DOS �β���ʸ���� UNIX ���ѹ�
(defun dos2unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; �Хåե��� UNIX �β���ʸ���� DOS ���ѹ�
(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))


;;
;;  �Хåե��˴����򿷤��˽񤭲ä��������к�  thanks to ���ڷ�����
;;
(defun my-buffer-file-coding-system-fixed-p ()
  (let ((buf-base (coding-system-base buffer-file-coding-system)))
    (not
     (or (and (eq buf-base 'undecided)
              (not (eq (coding-system-base
                        (car (detect-coding-region (point-min) (point-max))))
                       'undecided)))
         (and (eq buf-base (coding-system-base
                            default-buffer-file-coding-system))
              (not (eq (coding-system-base
                        (car (detect-coding-region (point-min) (point-max))))
                       'undecided)))))))

(defun my-set-file-coding-system-for-write (cs)
  (let ((buf-base (coding-system-base buffer-file-coding-system)))
    (unless (or (my-buffer-file-coding-system-fixed-p)
                (and (eq buf-base (coding-system-base cs))
                     (eq (coding-system-eol-type buffer-file-coding-system)
                         (coding-system-eol-type cs))))
      (when (y-or-n-p (format "set coding system to %s instead of %s ? "
                              cs buffer-file-coding-system))
        (set-buffer-file-coding-system cs))))
  nil)

(defun my-set-file-coding-system-for-write-quick (cs)
  (let ((buf-base (coding-system-base buffer-file-coding-system)))
    (unless (or (my-buffer-file-coding-system-fixed-p)
		(and (eq buf-base (coding-system-base cs))
		     (eq (coding-system-eol-type buffer-file-coding-system)
			 (coding-system-eol-type cs))))
      (set-buffer-file-coding-system cs)))
  nil)

;; �������add-hook���Ƥ����ȡ��Хåե��˴����򿷤��˽񤭲ä�������
;; �ɤδ��������ɤ�save���뤫��default��cs�Ȥ��ơ����䤷�Ƥ���롥
(defun my-set-file-encoding (cs)
  (add-hook 'local-write-file-hooks
            `(lambda ()
               (my-set-file-coding-system-for-write
                (quote ,cs)))))

;; �������add-hook���Ƥ����ȡ��Хåե��˴����򿷤��˽񤭲ä�������
;; ®����cs�ʴ��������ɤ�save���Ƥ���롥
(defun my-set-file-encoding-quick (cs)
  (add-hook 'local-write-file-hooks
            `(lambda ()
               (my-set-file-coding-system-for-write-quick
                (quote ,cs)))))

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
	     ) t)

;;; fortran-mode
(add-hook 'fortran-mode-hook
	  '(lambda ()
	     ; �������ɲä������ˡġ�
	     ; ʸ�������ɤ���䤷�Ƥ�����¸���Ƥۤ�����硥
;;	     (my-set-file-encoding default-buffer-file-coding-system)
	     ; EUC��®������¸�����硥
	     (my-set-file-encoding-quick 'euc-japan)
	     ) t)

;;; Emacs/XEmacs �Υ��ڥ�����å��� aspell ��Ȥ�
;;; ispell-mode: �Ѹ�Υ��ڥ��ư�����å����� Minor Mode

;;; [����] http://www-tsujii.is.s.u-tokyo.ac.jp/~yoshinag/tips/dot_emacs.html

(autoload 'ispell-word "ispell" "Check the spelling of word in buffer." t)
(autoload 'ispell-region "ispell" "Check the spelling of region." t)
(autoload 'ispell-buffer "ispell" "Check the spelling of buffer." t)
(autoload 'ispell-complete-word "ispell" "Look up current word in dictionary and try to complete it.
" t)
(autoload 'ispell-change-dictionary "ispell" "Change ispell dictionary." t)
(autoload 'ispell-message "ispell" "Check spelling of mail message or newsx post.")
(defun ispell-tex-buffer-p ()
 (memq major-mode '(plain-tex-mode latex-mode slitex-mode yatex-mode)))
(setq ispell-enable-tex-parser t)

;; ���ܸ�򤸤��ʸ��򰷤�
(eval-after-load "ispell"
 '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; latex ʸ��򰷤�
(setq ispell-filter-hook-args '("-w"))
(setq TeX-mode-hook
     (function
      (lambda ()
        (setq ispell-filter-hook "detex"))))

;; ispell ������� aspell ��Ȥ�
(setq-default ispell-program-name "aspell")

;;; ����¾
;;; /etc/aspell.conf �ƥե�������äơ���Ȥϡ�
;;; lang en_US �ǽ񤤤Ƥ�����


;; .emacs ends here
