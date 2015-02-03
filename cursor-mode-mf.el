(require 'cursor-mode)


(define-cursor-mode forward-cursor-mode "F"
  (cursor-mode-define-key map "d" 'cursor-mode-mb-backward-char t)
  (cursor-mode-define-key map "n" 'cursor-mode-mb-next-line t)
  (cursor-mode-define-key map "h" 'cursor-mode-mb-next-line t)
  (cursor-mode-define-key map "t" 'cursor-mode-mb-previous-line t)
  (cursor-mode-define-key map "f" 'cursor-mode-mf-forward-word t)
  (cursor-mode-define-key map "s" 'cursor-mode-mf-forward-sexp t)
  (cursor-mode-define-key map "y" 'cursor-mode-mf-forward-symbol t)
  (cursor-mode-define-key map "u" 'cursor-mode-mf-up-list t)
  (cursor-mode-define-key map "i" 'cursor-mode-mf-down-list t)
  (cursor-mode-define-key map "l" 'cursor-mode-mf-forward-list t)
  ;; (cursor-mode-define-key map "p" 'cursor-mode-mb-previous-line t)
  (cursor-mode-define-key map "e" 'cursor-mode-mf-forward-sentence t)
  ;; (define-key map "b" 'dtc-detach-mb-cursor)
  (define-key map "G" 'cursor-mode-disable-mode)
  (define-key map "g" 'cursor-mode-disable-mode))

(defun cursor-mode-mf-forward-word ()
  (interactive)
  (cursor-mode-eval '(forward-word)))

(defun cursor-mode-mf-forward-word-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(forward-word)))

(defun cursor-mode-mf-forward-sexp ()
  (interactive)
  (cursor-mode-eval '(forward-sexp)))

(defun cursor-mode-mf-forward-sexp-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(forward-sexp)))

(defun cursor-mode-mf-forward-symbol ()
  (interactive)
  (cursor-mode-eval '(forward-symbol 1)))

(defun cursor-mode-mf-forward-symbol-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(forward-symbol 1)))

(defun cursor-mode-mf-up-list ()
  (interactive)
  (cursor-mode-eval '(up-list)))

(defun cursor-mode-mf-up-list-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(up-list)))

(defun cursor-mode-mf-down-list ()
  (interactive)
  (cursor-mode-eval '(down-list)))

(defun cursor-mode-mf-down-list-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(down-list)))

(defun cursor-mode-mf-backward-list ()
  (interactive)
  (cursor-mode-eval '(forward-list)))

(defun cursor-mode-mf-backward-list-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(forward-list)))

(defun cursor-mode-mf-forward-page ()
  (interactive)
  (cursor-mode-eval '(forward-page)))

(defun cursor-mode-mf-forward-page-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(forward-page)))

(defun cursor-mode-mf-forward-sentence ()
  (interactive)
  (cursor-mode-eval '(forward-sentence)))

(defun cursor-mode-mf-forward-sentence-disable-mode ()
  (interactive)
  (cursor-mode-and-disable-mode '(forward-sentence)))


(global-set-key (kbd "M-f") 'forward-cursor-mode)
(global-set-key (kbd "C-n") 'forward-cursor-mode)


(provide 'cursor-mode-mf)
