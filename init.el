(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(zenburn-theme
                      auto-complete
		      magit
                      epc
                      deferred
                      jedi
                      go-mode
                      monky
		      haskell-mode
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; drop other packages in top-level
(add-to-list 'load-path "~/.emacs.d")

;; set theme
(load-theme 'zenburn t)

;; auto-complete setup
(require 'auto-complete-config)
(setq ac-dictionary-files (list (concat user-emacs-directory ".dict")))
(ac-config-default)

(add-hook 'python-mode 'jedi:setup)

;; manual python-mode until melpa/elpa fixed
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.1/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; disable tool bar since it takes up a lot of room
(tool-bar-mode -1)

;; delete selection 
(delete-selection-mode 1)

;; git version control
(require 'magit)

;; go language
(require 'go-mode)

;; julia
(require 'julia-mode)
 
;; tramp config
(setq tramp-default-method "ssh")

;; save command history
(setq savehist-additional-variables    ;; also save...
  '(search-ring regexp-search-ring)    ;; ... my search entries
  savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode t)                      ;; do customization before activate
