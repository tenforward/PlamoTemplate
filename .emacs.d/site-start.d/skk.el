;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-10
;;   Mule 上の仮名漢字変換システム SKK の設定
;;   C-x t でチュートリアルが起動します
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'pym)
(require 'skk-setup)

;;;;;;;;;; 使用する辞書の設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L をメモリ上に読み込んで利用する場合
;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M をメモリ上に読み込み、
;;; 見付からない場合は skkserv を起動して SKK-JISYO.L から検索する場合
;;; (skkexdic パッケージが必要です)
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
  "SKK チュートリアルかな/カナモードキーマップ" )

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
