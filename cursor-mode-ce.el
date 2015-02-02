(require 'cursor-mode)


(define-cursor-mode end-cursor-mode "E"
  (cursor-mode-define-key map "e" 'cursor-mode-ce-end-of-line)
  (cursor-mode-define-key map "b" 'cursor-mode-ce-end-of-buffer)
  (cursor-mode-define-key map "s" 'cursor-mode-ce-end-of-sexp)
  (cursor-mode-define-key map "d" 'cursor-mode-ce-end-of-defun)
  (define-key map "g" 'cursor-mode-disable-mode)
  ;; (define-key map (kbd "C-e") 'cursor-mode-detach-ce-cursor)
  )

(defun cursor-mode-ce-end-of-line ()
  (interactive)
  (cursor-mode-eval '(end-of-line)))

(defun cursor-mode-ce-end-of-line-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(end-of-line)))

(defun cursor-mode-ce-end-of-buffer ()
  (interactive)
  (cursor-mode-eval '(end-of-buffer)))

(defun cursor-mode-ce-end-of-buffer-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(end-of-buffer)))

(defun cursor-mode-ce-end-of-sexp ()
  (interactive)
  (cursor-mode-eval '(end-of-sexp)))

(defun cursor-mode-ce-end-of-sexp-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(end-of-sexp)))

(defun cursor-mode-ce-end-of-defun ()
  (interactive)
  (cursor-mode-eval '(end-of-defun)))

(defun cursor-mode-ce-end-of-defun-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(end-of-defun)))


(global-set-key (kbd "C-e") 'end-cursor-mode)


(provide 'cursor-mode-ce)
