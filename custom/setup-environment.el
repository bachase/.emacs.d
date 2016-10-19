(provide 'setup-environment)

;; When running in Windows, we want to use an alternate shell so we
;; can be more unixy.
;; Set Windows-specific preferences if running in a Windows environment.
(defun udf-windows-setup () (interactive)
  (add-to-list 'exec-path "C:/lib") ;; fakecygpty/qkill here
  (setenv "PATH" (concat "C:/msys64/usr/bin:" (getenv "PATH"))) ;; ensure msys bash at front
  (setenv "PATH" (concat "C:/Program Files/Git/bin:" (getenv "PATH"))) ;; but we get our git
  (require 'fakecygpty)
  (fakecygpty-activate)
  (setq explicit-shell-file-name
      "C:/msys64/usr/bin/bash.exe")
  (setq shell-file-name explicit-shell-file-name)
  )

(if (eq system-type 'windows-nt)
    (udf-windows-setup))

;; The emacs command 'shell' normally brings you back to the same
;; *Shell* buffer every time.
(defun new-shell()
  "Start up a new shell in a uniquely-named buffer."
  (interactive)
  (shell)
  ;;
  ;; Look for the process that exists for the now current buffer. Rename
  ;; it to include its process ID.
  ;;
  (let ((procs (process-list))
		(aProc nil)
		(buf (current-buffer))
		(pid nil))
	(while procs
	  (setq aProc (car procs)
			procs (cdr procs))
	  (if (eq buf (process-buffer aProc))
		  (setq pid (process-id aProc)
				procs nil)))
	(if pid
		(rename-buffer (format "%s (%d)" (file-name-nondirectory shell-file-name) pid))
	  (rename-buffer "shell" t))))

(grep-compute-defaults)
(grep-apply-setting 'grep-find-command "find . -type f -name \"*.py\" -print0 | xargs -0 -e grep -nH -e")
