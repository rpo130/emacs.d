;; 工具栏关闭
(tool-bar-mode -1)
;; 行号显示
(global-linum-mode 1)

;; 关闭备份文件
(setq make-backup-files nil)

;; key bind
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

;; china mirror
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'evil)
(evil-mode 1)
(load-theme 'monokai 1)