;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-10
;;   Mule ��β�̾�����Ѵ������ƥ� SKK ������
;;   C-x t �ǥ��塼�ȥꥢ�뤬��ư���ޤ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'pym)
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
