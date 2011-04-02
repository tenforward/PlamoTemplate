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
