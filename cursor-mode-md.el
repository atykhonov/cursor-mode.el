(define-cursor-mode kill-forward-cursor-mode "D"
  (cursor-mode-define-key map "d" 'cursor-mode-md-kill-word t)
  (cursor-mode-define-key map "w" 'cursor-mode-md-kill-word t)
  (cursor-mode-define-key map "s" 'cursor-mode-md-kill-sexp t)
  (cursor-mode-define-key map "a" 'cursor-mode-md-kill-paragraph t)
  (cursor-mode-define-key map "e" 'cursor-mode-md-kill-sentence t)
  (cursor-mode-define-key map "G" 'cursor-mode-disable-mode)
  (cursor-mode-define-key map "g" 'cursor-mode-disable-mode))

(defun cursor-mode-md-kill-word ()
  (interactive)
  (cursor-mode-eval '(kill-word 1)))

(defun cursor-mode-md-kill-word-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-word 1)))

(defun cursor-mode-md-kill-sexp ()
  (interactive)
  (cursor-mode-eval '(kill-sexp)))

(defun cursor-mode-md-kill-sexp-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-sexp)))

(defun cursor-mode-md-kill-paragraph ()
  (interactive)
  (cursor-mode-eval '(kill-paragraph 1)))

(defun cursor-mode-md-kill-paragraph-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-paragraph 1)))

(defun cursor-mode-md-kill-sentence ()
  (interactive)
  (cursor-mode-eval '(kill-sentence)))

(defun cursor-mode-md-kill-sentence-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-sentence)))

(global-set-key (kbd "M-d") 'kill-forward-cursor-mode)


(provide 'cursor-mode-md)
