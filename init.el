(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(zenburn-theme
                      auto-complete
		      magit
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; set theme
(load-theme 'zenburn t)

;; auto-complete setup
(require 'auto-complete-config)
(setq ac-dictionary-files (list (concat user-emacs-directory ".dict")))
(ac-config-default)
;; hack to fix ac-sources after pycomplete.el breaks it
(add-hook 'python-mode-hook
          '(lambda ()
             (setq ac-sources '(ac-source-pycomplete
                                ac-source-abbrev
                                ac-source-dictionary
                                ac-source-words-in-same-mode-buffers))))


;; manual python-mode until melpa/elpa fixed
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.1/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; disable tool bar since it takes up a lot of room
(tool-bar-mode -1)

;; delete selection
(delete-selection-mode 1)