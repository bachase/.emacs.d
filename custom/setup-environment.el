(provide 'setup-environment)

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
		(rename-buffer (format "%s (%d)" shell-file-name pid))
	  (rename-buffer "shell" t))))

(grep-compute-defaults)
(grep-apply-setting 'grep-find-command "find . -type f -name \"*.py\" -print0 | xargs -0 -e grep -nH -e")
