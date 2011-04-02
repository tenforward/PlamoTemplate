;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule 上で dic を利用するための設定です
;;   ~/lib/emacs に /usr/doc/dic/eldic.el をコピーして
;;   dic-shell-file-name の辺りを適切に設定してください。
;;   C-c C-c C-e で英和、C-c C-c C-j で和英が引けます。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)

;;;
;;; emacs-20 で日本語の man を見る
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

;;; F9 キーで現在のカーソル位置にあるライブラリコールの man ページを表示
(cond ((eq window-system 'x)
       (global-set-key [(f9)] (lambda () (interactive) (manual-entry (current-word)))))
      ((null window-system)
       (global-set-key "\e[20~" (lambda () (interactive) (manual-entry (current-word))))))

