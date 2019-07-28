(setq debug-on-error t)

(when (<= emacs-major-version 24)
  (error "Your emacs is too old"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)
;; 工具栏关闭
(tool-bar-mode -1)
;; 行号显示
(global-linum-mode 1)

(setq-default tab-width 4)

;;可视化空白符
(global-whitespace-mode 1)

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

;;自动安装包
(require 'cl)

(defvar my/packages '(
					  evil
					  racket-mode
					  monokai-theme
					  ))
(setq package-selected-packages my/packages)
(defun my/packages-install-p ()
  (loop for pkg in my/packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t)))

(unless (my/packages-install-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
	(when (not (package-installed-p pkg))
	  (package-install pkg))))

;;包配置
(evil-mode 1)
(load-theme 'monokai 1)

(setq racket-racket-program "racket")
(setq racket-raco-program "raco")

;;set gc threshold in startup and after
(let ((n (* 32 1024 1024))
      (i (* 128 1024 1024)))
  (setq gc-cons-threshold i))
