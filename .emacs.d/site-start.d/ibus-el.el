;;; ibus.el ���� (contrib/emacs �ʲ��ˤ���ޤ�)
;;;   http://www11.atwiki.jp/s-irie/pages/21.html
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

;; Ctrl-Space �� Set Mark �˻���
(ibus-define-common-key ?\C-\s nil)
;; 
(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; 
(global-set-key "\C-\\" 'ibus-toggle)