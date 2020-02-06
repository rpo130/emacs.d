(when (<= emacs-major-version 24)
  (error "Your emacs is too old"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)

(setq inhibit-startup-message t)
(menu-bar-mode 0)
(tool-bar-mode 0)

(global-hl-line-mode 1)
(global-linum-mode 1)

(setq-default tab-width 4)

(global-whitespace-mode 0)

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

(require 'cl)

(defvar my/packages '(
					  evil
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

;;set gc threshold in startup and after
(let ((n (* 32 1024 1024))
      (i (* 128 1024 1024)))
  (setq gc-cons-threshold i))
