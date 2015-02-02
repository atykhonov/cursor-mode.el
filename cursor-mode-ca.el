(require 'cursor-mode)


(define-cursor-mode beginning-cursor-mode "A"
  (define-key map "a" 'cursor-mode-ca-beginning-of-line)
  (define-key map "b" 'cursor-mode-ca-beginning-of-buffer)
  (define-key map "s" 'cursor-mode-ca-beginning-of-sexp)
  (define-key map "d" 'cursor-mode-ca-beginning-of-defun)
  (define-key map "l" 'cursor-mode-ca-beginning-of-line-text)
  (define-key map "g" 'cursor-mode-disable-mode)
  ;; (define-key map (kbd "C-e") 'cursor-mode-detach-ce-cursor)
  )

(defun cursor-mode-ca-beginning-of-line ()
  (interactive)
  (cursor-mode-eval '(beginning-of-line)))

(defun cursor-mode-ca-beginning-of-line-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(beginning-of-line)))

(defun cursor-mode-ca-beginning-of-buffer ()
  (interactive)
  (cursor-mode-eval '(beginning-of-buffer)))

(defun cursor-mode-ca-beginning-of-buffer-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(beginning-of-buffer)))

(defun cursor-mode-ca-beginning-of-sexp ()
  (interactive)
  (cursor-mode-eval '(beginning-of-sexp)))

(defun cursor-mode-ca-beginning-of-sexp-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(beginning-of-sexp)))

(defun cursor-mode-ca-beginning-of-defun ()
  (interactive)
  (cursor-mode-eval '(beginning-of-defun)))

(defun cursor-mode-ca-beginning-of-defun-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(beginning-of-defun)))

(defun cursor-mode-ca-beginning-of-line-text ()
  (interactive)
  (cursor-mode-eval '(beginning-of-line-text)))

(defun cursor-mode-ca-beginning-of-line-text-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(beginning-of-line-text)))


(global-set-key (kbd "C-a") 'beginning-cursor-mode)


(provide 'cursor-mode-ca)
