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
