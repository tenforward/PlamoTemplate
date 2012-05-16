(require 'gtags)

;; パスの表示モードを相対パスに
(setq gtags-path-style 'relative)

;; タグジャンプ先を読み込み専用に
(setq view-read-only t)
(setq gtags-read-only t)