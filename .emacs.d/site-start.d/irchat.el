;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; irchat
;;   IRC (チャット) クライアントの設定
;;   M-x irchat で起動します
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path
      (append '("/usr/share/emacs/site-lisp/irchat-2.4jp23b") load-path))
(autoload 'irchat "irchat" nil t)

;;; IRC server の指定
;;; (いずれか一つをコメントアウトします)
;;(setq irchat-server "irc.tohoku.ac.jp")
;;(setq irchat-server "irc.kyutech.ac.jp")
;;(setq irchat-server "irc.tokyo.wide.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")
;;(setq irchat-server "irc.huie.hokudai.ac.jp")
;;(setq irchat-server "irc.cc.yamaguchi-u.ac.jp")
;;(setq irchat-server "irc.karrn.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")

;;; ユーザー名とニックネーム
;;; (nick は半角英数および []{}_\^ からなる最大 9 文字の文字列です)
(setq irchat-name "IRC sample user")
(setq irchat-nickname "PJEtest")

;;; デフォルトで参加するチャンネルのリスト
;;;  （ここに書いたチャンネルには irchat の起動と同時に参加できます）
;;(setq irchat-startup-channel-list '("#linuxjp,#pjetest"))
(setq irchat-startup-channel-list '("#pjetest"))

;;; オプション
;;;   詳細は /usr/doc/irchat-2.4jp23a/FAQ-about-jp23.txt 参照
(setq irchat-reconnect-automagic t)      ; 切れた場合に再接続を試みる
;;(setq irchat-channel-buffer-mode t)    ; チャネル分割表示モード
;;(setq irchat-display-channel-always t)
;;(setq irchat-default-freeze-local nil)
