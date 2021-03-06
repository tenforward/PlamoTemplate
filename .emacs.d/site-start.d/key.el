;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; その他の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ここはよくわかりませぬ ^^;

;;; マクロサーチパスの追加
;;; ~/lib/emacs 以下にユーザ用の *.el, *.elc を置くことができます
;;(setq load-path (append '("~/lib/emacs") load-path))

;;; C-h と Del の入れ替え
;;; Help が Shift + Ctrl + h および Del に割当てられ、
;;; 前一文字削除が Ctrl + h に割当てられます
;;(load-library "term/keyswap")
;;(if (eq window-system 'x)
;;    (progn
;;      (define-key function-key-map [delete] [8])
;;      (put 'delete 'ascii-character 8)))


;;; BS,Delete などの特殊キーの設定
;;  とにかく，
;;   ・Deleteは「現在の一文字消去」
;;   ・BackSpaceは「後退」
;;  にこだわってみました．
;;  Windows 上の端末エミュレータ TeraTerm の設定例が
;;  この後にあります．
;;  TeraTerm の キーボードの設定の DEL by は Backspace key
;;  に割当てることをお勧めします．
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
       ;; konとlinux端末のdeleteキー
       (global-set-key "\e[3~" 'delete-char)
       (global-set-key [8] 'delete-backward-char)
       (if (or (equal (getenv "TERM" ) "kterm")
;	       (equal (getenv "TERM" ) "xterm")
	       (equal (getenv "TERM" ) "sun")
	       ;; TeraTermで DEL by Delete key の場合は有効にする
;	       (equal (substring (concat (getenv "TERM") "__") 0 2) "vt")
	       )
	   (progn
             ;; keyswap は obsolete になったそうなので．
	     ;; (load "term/keyswap")
	     (keyboard-translate ?\C-h ?\C-?)
	     ;; (keyboard-translate ?\C-? ?\C-h)
             (define-key function-key-map [delete] [8])
             (put 'delete 'ascii-character 8)
             ;; これは必要かどうか分からない
	     (if (not (equal (getenv "TERM" ) "xterm"))
		 (global-set-key [8] 'delete-char))
	     )
	 )
       ))

;;  【TeraTermPro の KEYBOARD.CNF の設定について】
;; /usr/doc/emacs-21.3/TeraTerm/ に KEYBOARD.CNF が入っています．
;; このKEYBOARD.CNF を使うと，[Home][End][Delete][PageUp]，
;; などが利用でき，テンキーも不自由なく使えて便利になります．

;;; 一般的な設定
;;  Esc→スペース でマークセット
(global-set-key "\e " 'set-mark-command)
(global-set-key "\M-/" 'help-for-help)
(global-set-key "\M-?" 'help-for-help)
(global-set-key "\M-g" 'goto-line)

;;; for glibc2.1 日本語 locale
;;; thanks to 花高さん
;;; Emacs20.5 では不要
;
; (let ((lang (or (getenv "LC_ALL")(getenv "LC_TIME")(getenv "LANG"))))
;   (cond
;    ((and lang (string-match "^ja" lang))
;     (setq dired-move-to-filename-regexp
;           " [1 ][0-9]月 [0-3 ][0-9]日 +[0-9][0-9][:0-9][0-9][0-9年] "))))

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
     "検索結果表示バッファを表示する関数"
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
                  (message "この前にもエントリがあります。"))
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

;; アスキーテーブルの表示
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

;; バッファの DOS の改行文字を UNIX に変更
(defun dos2unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; バッファの UNIX の改行文字を DOS に変更
(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))


;;
;;  バッファに漢字を新たに書き加えた時の対策  thanks to 鈴木圭一様
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

;; こちらをadd-hookしておくと，バッファに漢字を新たに書き加えた時，
;; どの漢字コードでsaveするか，defaultをcsとして，質問してくれる．
(defun my-set-file-encoding (cs)
  (add-hook 'local-write-file-hooks
            `(lambda ()
               (my-set-file-coding-system-for-write
                (quote ,cs)))))

;; こちらをadd-hookしておくと，バッファに漢字を新たに書き加えた時，
;; 速攻でcsな漢字コードでsaveしてくれる．
(defun my-set-file-encoding-quick (cs)
  (add-hook 'local-write-file-hooks
            `(lambda ()
               (my-set-file-coding-system-for-write-quick
                (quote ,cs)))))
