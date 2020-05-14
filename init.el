(when (<= emacs-major-version 24)
  (error "Your emacs is too old"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)

(setq inhibit-startup-message t)

(show-paren-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)

(global-hl-line-mode 1)

(setq-default tab-width 4)

(global-whitespace-mode 0)

(setq make-backup-files nil)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(setq package-archives
	  '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
		("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
			 :ensure t
			 :config (evil-mode 1))

(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai 1))

;;set gc threshold in startup and after
(let ((n (* 32 1024 1024))
      (i (* 128 1024 1024)))
  (setq gc-cons-threshold i))
