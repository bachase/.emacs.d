(provide 'setup-editing)

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key [(control x) (k)] 'kill-this-buffer)
;; use space to indent by default
(setq-default indent-tabs-mode nil)
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; update any change made on file to the current buffer
(global-auto-revert-mode 1)

;; GROUP: Editing -> Killing
(setq
 kill-ring-max 5000 ; increase kill-ring capacity
 kill-whole-line t  ; if NIL, kill whole line and move the next line up
 )

(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(require 'uniquify)
(setq uniquify-after-kill-buffer-p nil) ; don't rename
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
