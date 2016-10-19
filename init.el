(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(tool-bar-mode 0)
(defalias 'yes-or-no-p 'y-or-n-p)

(defconst my-packages
  '(company
    zenburn-theme
    ggtags
    helm
    helm-gtags
    helm-ag
    helm-descbinds
    clean-aindent-mode
    dtrt-indent
    ws-butler
    smartparens 
    elpy
    pyvenv
    volatile-highlights 
    exec-path-from-shell))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; add your modules path
(add-to-list 'load-path "~/.emacs.d/custom/")

(require 'setup-editing)
(require 'setup-convenience)
(require 'setup-helm)
(require 'setup-environment)


;; load theme; extra t says not to prompt for safety
(load-theme 'zenburn t)


;; disable tool bar since it takes up a lot of room
(tool-bar-mode -1)

;; tramp config
(setq tramp-default-method "ssh")

(set-default-font "Inconsolata 12")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell volatile-highlights elpy smartparens ws-butler dtrt-indent clean-aindent-mode helm-descbinds helm-ag helm-gtags helm ggtags zenburn-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
