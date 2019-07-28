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
(require 'evil)
(evil-mode 1)
(load-theme 'monokai 1)
(require 'racket-mode)
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")



;;set gc threshold in startup and after
(let ((n (* 32 1024 1024))
      (i (* 128 1024 1024)))
  (setq gc-cons-threshold i))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (go-mode racket-mode vlf monokai-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
