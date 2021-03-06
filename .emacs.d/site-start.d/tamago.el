;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tamago-4 の設定 (Plamo標準)
;;   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; wnn とか canna とかの使用と同時に tamago 起動するようになっているので
;; このままでは色々な設定 (customize-tamago 内など) が効かないと思う。

;;; 初期化
(setq emacs-ime "default")

;; 従来の環境から Tamago-4 に移行する場合は、
;; ~/.eggrc を削除してください．

;;; Anthy を使う場合はこちらを有効にする
(setq default-input-method "japanese-egg-anthy")

;;; Canna を使う場合はこちらを有効にする
;(setq emacs-ime "canna")

;;; Wnn を使う場合はこちらを有効にする
;(setq emacs-ime "wnn")

;;  Wnn の場合は 2 つの入力モード(EggRemix or Egg)を選べます
;;; Tamago の入力モードを Egg ReMix にする
;(setq egg-mode-preference "remix")
;;; Tamago の入力モードを 通常の Egg にする
(setq egg-mode-preference "egg")

;; このあたりは 21.3/lisp/language/japan-util.el を参照
(defun its-han-katakana ()
  (interactive)
  (its-convert (lambda (str lang) (japanese-hankaku str))))

(defun its-zen-katakana ()
  (interactive)
  (its-convert (lambda (str lang) (japanese-hiragana str)))
  (its-convert (lambda (str lang) (japanese-katakana str))))

;;; Tamago-4 の共通のカスタマイズ(egg-cnv.elを参照)
(defun customize-tamago ()
  ;; 変換時に下部に候補を表示(数字で何回後に候補表示するかが決まる)．
  (setq egg-conversion-auto-candidate-menu 1)
  ;; 変換時に侯補を別の窓に全て表示する．
;  (setq egg-conversion-auto-candidate-menu-show-all t)
  ;; 候補表示時，数字あるいはアルファベットを入力した時点で確定にする．
  (setq menudiag-select-without-return t)
  ;; 一覧から選択後は次の文節に移動
  (setq egg-conversion-stay-after-validate nil)
  ;; "." で「．」、"," で「，」を入力．
  (setq its-hira-period "．")
  (setq its-hira-comma  "，")
  (setq its-hira-enable-double-n t)
  (setq its-hira-open-bracket "「")
  (setq its-hira-close-bracket "」")
  (setq its-hira-horizontal  "ー")
  ;; キーバインド
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
  ;; 変換中のマウス操作を禁止
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
  ;;; remix 以外(egg-canna,egg-wnn)の場合の設定
  (if (not (and (equal egg-mode-preference "remix") (equal emacs-ime "wnn")))
      (progn
	;; キーバインド
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
	;; 変換中のマウス操作を禁止
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

;;; かんなのカスタマイズ
(defun customize-egg-canna ()
  (add-hook 'egg-mode-hook 
	    '(lambda ()
	       ;; default.kpdef にできるだけ忠実に
	       (its-defrule "{"  "『" nil t)
	       (its-defrule "}"  "』" nil t)
	       (its-defrule "~"  "￣" nil t)
	       (its-defrule "@-"  "−" nil t)
	       (its-defrule "@@"  "　" nil t)
	       (its-defrule "@/"  "・" nil t)
	       (its-defrule "@\\" "＼" nil t)
	       (its-defrule "@,"  "，" nil t)
	       (its-defrule "@."  "．" nil t)
	       (its-defrule "@~"  "〜" nil t)
	       (its-defrule "@|"  "｜" nil t)
	       (its-defrule "@||" "‖" nil t)
	       (its-defrule "@3"  "…" nil t)
	       (its-defrule "@2"  "‥" nil t)
	       (its-defrule "@("  "（" nil t)
	       (its-defrule "@)"  "）" nil t)
	       (its-defrule "@["  "［" nil t)
	       (its-defrule "@]"  "］" nil t)
	       (its-defrule "@{"  "｛" nil t)
	       (its-defrule "@}"  "｝" nil t)
	       ;; 以下は勝手な拡張
	       (its-defrule "@?"  "・" nil t)
	       (its-defrule "@|||" "¬" nil t)
	       (its-defrule "@`"  "¢" nil t)
	       (its-defrule "@="  "£" nil t)
	       (its-defrule "@:"  "ヶ" nil t)
	       (its-defrule "@*"  "ヶ" nil t)
	       (its-defrule "@^"  "々" nil t)
	       (its-defrule "@~~" "々" nil t)
	       ))
  ;; キー設定
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
		 ;; TeraTermで DEL by Delete key の場合は有効にする
;		 (equal (substring (concat (getenv "TERM") "__") 0 2) "vt")
		 )
	     (define-key its-mode-map [8] 'its-delete-SYL)
	   ))))

;;; Wnnのカスタマイズ
(defun customize-egg-wnn ()
  ;; キー設定
  (cond ((eq window-system 'x)
	 )
	((null window-system)
	 (define-key its-mode-map "\e[3~" 'its-delete-backward-SYL)
	 )))

;;; Egg ReMix のカスタマイズ
(defun customize-egg-remix ()
  ;; キー設定
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
	       ;; 変換中のマウス操作を禁止
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
	       ;; キー設定
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

;;; Tamago-4 基本設定

;;; 半角/全角キーでも変換を開始できるようにする
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
(define-key isearch-mode-map [zenkaku-hankaku] 'isearch-toggle-input-method)
(define-key global-map [M-zenkaku-hankaku] 'toggle-input-method)
(define-key isearch-mode-map [M-zenkaku-hankaku] 'isearch-toggle-input-method)
(define-key global-map [kanji] 'toggle-input-method)
(define-key isearch-mode-map [kanji] 'isearch-toggle-input-method)
(define-key global-map [M-kanji] 'toggle-input-method)
(define-key isearch-mode-map [M-kanji] 'isearch-toggle-input-method)
;;; 
;;; 改良版 egg-toroku-region
(defun egg-f4-mode (start end &optional nth-backend)
  (interactive "r\nP")
  (if (not (eq inactivate-current-input-method-function 'egg-mode))
      (progn
	(activate-input-method default-input-method)
	(inactivate-input-method)))
  (egg-toroku-string (buffer-substring start end) nil nil nil nil nth-backend))
;;; F4 キーで選択領域を単語登録
(if (eq window-system 'x)
    (progn
      (global-set-key [f4] 'egg-f4-mode)
      )
  (progn
    (global-set-key "\e[14~" 'egg-f4-mode)
    ))
;;;
(if (equal emacs-ime "canna")
    ;;;;;; かんなの設定
    (progn
      ;;; サーバの指定。
      (setq canna-hostname "localhost")
      ;;; InputMethod の設定
      (setq default-input-method "japanese-egg-canna") 
      ;;; emcws のCANNAのコマンドを使う
      (add-hook 'canna-load-hook '(lambda () 
				    (load "egg-canna")
				    (customize-tamago)
				    (customize-egg-canna)))
      ;;; Ctrl + o でも使えるようにする
      (define-key global-map "\C-o" 'toggle-input-method)
      (define-key isearch-mode-map "\C-o" 'isearch-toggle-input-method)
      ;;; ファンクションキーまわりを emcws と同等にする
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
	    ;;; 新しいfaceをつくる
	    (make-face 'canna-face)
	    (make-face 'canna-conversion-face)
	    ;;; faceの前景色
	    (set-face-foreground 'canna-face "darkblue")
	    (set-face-foreground 'canna-conversion-face "white")
	    ;;; faceの背景色
	    (set-face-background 'canna-face "lightcyan1")
;	    (set-face-bold-p 'canna-conversion-face t)
;	    (set-face-inverse-video-p 'canna-conversion-face t)
	    (set-face-background 'canna-conversion-face "royalblue")
	    ;;; 下線をつける
	    (set-face-underline 'canna-face t)
;	    (set-face-underline 'canna-conversion-face t)
	    ;;; egg-cannaでつかうfaceに設定
	    (setq its-fence-face 'canna-face)
	    (setq egg-conversion-face 'canna-conversion-face)
;	    (setq its-fence-invisible t)
;	    (setq egg-conversion-fence-invisible t)
	    ;; 変換時のカーソルの設定
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
      ;;;;;; Wnn の設定
      (progn
	;;; ロードパスの設定
	(setq load-path (cons (expand-file-name "/usr/share/emacs/site-lisp/egg-remix") load-path))
	;;; サーバの指定。
	(setq wnn-jserver "localhost")
	(add-hook 'wnn-load-hook '(lambda () 
				    (customize-tamago)
				    (customize-egg-wnn)))
	;;; 新しいfaceをつくる
	(make-face 'remix-face)
	;;; faceの前景色
	(set-face-foreground 'remix-face "blue") 
	;;; faceの背景色
	(set-face-background 'remix-face "lightskyblue") 
	;;; 下線をつける
	(set-face-underline 'remix-face t) 
	;;; remixでつかうfaceに設定
	(setq remix-fence-face 'remix-face) 
	;;; 全角アルファベットをフェンスで入力しない
	(setq its-enable-fullwidth-alphabet nil) 
	;;; 変換モードで候補をサイクリックに選択
	(setq egg-conversion-wrap-select t) 
	(load "egg-remix") 
	(customize-egg-remix)
	))
  )

