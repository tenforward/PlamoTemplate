;;; ibus.el 設定 (contrib/emacs 以下にあります)
;;;   http://www11.atwiki.jp/s-irie/pages/21.html
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)

;; Ctrl-Space は Set Mark に使用
;(ibus-define-common-key ?\C-\s nil)
;; ibus オン・オフ・無効化時のカーソル色を変更する
;(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; ibus のトグルキーの設定
;;; Ctrl-\
;(global-set-key (kbd "C-\\") 'ibus-toggle)
;;; Meta-Space
;(global-set-key (kbd "M-SPC") 'ibus-toggle)