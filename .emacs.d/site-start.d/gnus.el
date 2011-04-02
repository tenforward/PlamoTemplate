;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNUS
;;   NetNews リーダー GNUS
;;   M-x gnus で起動します
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path
      (append '("/usr/share/emacs/21.3/lisp/gnus")
	      load-path))
;; News Server 名やドメイン名を指定してください
(setq gnus-nntp-server "news.hoge.hoge.or.jp")
(setq gnus-local-domain "hoge.hoge.or.jp")
(setq gnus-local-organization "HogeHoGe Org.")
(setq gnus-use-generic-from t)
