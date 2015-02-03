(require 'cursor-mode)


(define-cursor-mode back-cursor-mode "B"
  (cursor-mode-define-key map "d" 'cursor-mode-mb-backward-char t)
  (cursor-mode-define-key map "n" 'cursor-mode-mb-forward-char t)
  (cursor-mode-define-key map "h" 'cursor-mode-mb-next-line t)
  (cursor-mode-define-key map "t" 'cursor-mode-mb-previous-line t)
  (cursor-mode-define-key map "b" 'cursor-mode-mb-backward-word t)
  (cursor-mode-define-key map "s" 'cursor-mode-mb-backward-sexp t)
  (cursor-mode-define-key map "y" 'cursor-mode-mb-backward-symbol t)
  (cursor-mode-define-key map "u" 'cursor-mode-mb-backward-up-list t)
  (cursor-mode-define-key map "l" 'cursor-mode-mb-backward-list t)
  (cursor-mode-define-key map "p" 'cursor-mode-mb-previous-line t)
  (cursor-mode-define-key map "e" 'cursor-mode-mb-backward-sentence t)
  ;; (cursor-mode-define-key map "Q" 'cursor-mode-disable-mode)
  ;; (cursor-mode-define-key map "q" 'cursor-mode-disable-mode-here)
  (define-key map "G" 'cursor-mode-disable-mode)
  (define-key map "g" 'cursor-mode-disable-mode)
  ;; (cursor-mode-define-key map "f" 'cursor-mode-detach-mf-cursor)
  ;; (cursor-mode-define-key map (kbd "C-e") 'cursor-mode-detach-ce-cursor)
  )


(defun cursor-mode-mb-backward-char ()
  (interactive)
  (cursor-mode-eval '(backward-char)))

(defun cursor-mode-mb-backward-char-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-char)))

(defun cursor-mode-mb-forward-char ()
  (interactive)
  (cursor-mode-eval '(forward-char)))

(defun cursor-mode-mb-forward-char-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(forward-char)))

(defun cursor-mode-mb-next-line ()
  (interactive)
  (cursor-mode-eval '(next-line)))

(defun cursor-mode-mb-next-line-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(next-line)))

(defun cursor-mode-mb-previous-line ()
  (interactive)
  (cursor-mode-eval '(previous-line)))

(defun cursor-mode-mb-previous-line-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(previous-line)))

(defun cursor-mode-mb-backward-word ()
  (interactive)
  (cursor-mode-eval '(backward-word)))

(defun cursor-mode-mb-backward-word-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-word)))

(defun cursor-mode-mb-backward-sexp ()
  (interactive)
  (cursor-mode-eval '(backward-sexp)))

(defun cursor-mode-mb-backward-sexp-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-sexp)))

(defun cursor-mode-mb-backward-symbol ()
  (interactive)
  (cursor-mode-eval '(forward-symbol -1)))

(defun cursor-mode-mb-backward-symbol-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(forward-symbol -1)))

(defun cursor-mode-mb-backward-up-list ()
  (interactive)
  (cursor-mode-eval '(backward-up-list)))

(defun cursor-mode-mb-backward-up-list-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-up-list)))

(defun cursor-mode-mb-backward-list ()
  (interactive)
  (cursor-mode-eval '(backward-list)))

(defun cursor-mode-mb-backward-list-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-list)))

(defun cursor-mode-mb-backward-page ()
  (interactive)
  (cursor-mode-eval '(backward-page)))

(defun cursor-mode-mb-backward-page-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-page)))

(defun cursor-mode-mb-backward-sentence ()
  (interactive)
  (cursor-mode-eval '(backward-sentence)))

(defun cursor-mode-mb-backward-sentence-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(backward-sentence)))


(global-set-key (kbd "M-b") 'back-cursor-mode)
(global-set-key (kbd "M-a") 'back-cursor-mode)
(global-set-key (kbd "C-b") 'back-cursor-mode)
(global-set-key (kbd "C-p") 'back-cursor-mode)


(provide 'cursor-mode-mb)
