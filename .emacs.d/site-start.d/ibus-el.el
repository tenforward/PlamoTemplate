;;; ibus.el ���� (contrib/emacs �ʲ��ˤ���ޤ�)
;;;   http://www11.atwiki.jp/s-irie/pages/21.html
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)

;; Ctrl-Space �� Set Mark �˻���
;(ibus-define-common-key ?\C-\s nil)
;; ibus ���󡦥��ա�̵�������Υ������뿧���ѹ�����
;(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; ibus �Υȥ��륭��������
;;; Ctrl-\
;(global-set-key (kbd "C-\\") 'ibus-toggle)
;;; Meta-Space
;(global-set-key (kbd "M-SPC") 'ibus-toggle)