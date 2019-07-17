(setq debug-on-error t)

(when (<= emacs-major-version 24)
  (error "Your emacs is too old"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)
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
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)
(require 'evil)
(evil-mode 1)
(load-theme 'monokai 1)

;;set gc threshold in startup and after
(let ((n (* 32 1024 1024))
      (i (* 128 1024 1024)))
  (setq gc-cons-threshold i))
