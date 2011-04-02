;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule ��� dic �����Ѥ��뤿�������Ǥ�
;;   ~/lib/emacs �� /usr/doc/dic/eldic.el �򥳥ԡ�����
;;   dic-shell-file-name ���դ��Ŭ�ڤ����ꤷ�Ƥ���������
;;   C-c C-c C-e �Ǳ��¡�C-c C-c C-j ���±Ѥ������ޤ���
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)

;;;
;;; emacs-20 �����ܸ�� man �򸫤�
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

;;; F9 �����Ǹ��ߤΥ���������֤ˤ���饤�֥�ꥳ����� man �ڡ�����ɽ��
(cond ((eq window-system 'x)
       (global-set-key [(f9)] (lambda () (interactive) (manual-entry (current-word)))))
      ((null window-system)
       (global-set-key "\e[20~" (lambda () (interactive) (manual-entry (current-word))))))

