(define-cursor-mode kill-cursor-mode "K"
  (cursor-mode-define-key map "k" 'cursor-mode-ck-kill-line)
  (cursor-mode-define-key map "o" 'cursor-mode-ck-kill-line-and-join-forward)
  (cursor-mode-define-key map "l" 'cursor-mode-ck-kill-line-replace)
  (cursor-mode-define-key map "r" 'cursor-mode-ck-kill-region)
  (cursor-mode-define-key map "c" 'cursor-mode-ck-kill-rectangle)
  (cursor-mode-define-key map "s" 'cursor-mode-ck-kill-sexp-at-point)
  (cursor-mode-define-key map "y" 'cursor-mode-ck-kill-symbol-at-point)
  (cursor-mode-define-key map "w" 'cursor-mode-ck-kill-word-at-point)
  ;; (define-key map (kbd "C-e") 'cursor-mode-detach-ce-cursor)
  (define-key map "G" 'cursor-mode-disable-mode)
  (define-key map "g" 'cursor-mode-disable-mode))

(defun cursor-mode-ck-kill-line ()
  (interactive)
  (cursor-mode-eval '(kill-line)))

(defun cursor-mode-ck-kill-line-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-line)))

(defun cursor-mode-ck-kill-thing-at-point (thing &optional attach)
  (interactive)
  (let ((expr '(let ((bounds (bounds-of-thing-at-point thing)))
                 (iregister-copy-to-register (car bounds) (cdr bounds) '(4)))))
    (if attach
        (cursor-mode-eval-and-disable-mode expr)
      (cursor-mode-eval expr))))

(defun cursor-mode-ck-kill-line-and-join-forward ()
  (interactive)
  (cursor-mode-ck-kill-thing-at-point 'line))

(defun cursor-mode-ck-kill-line-and-join-forward-disable-mode ()
  (interactive)
  (cursor-mode-ck-kill-thing-at-point 'line t))

(defun cursor-mode-ck-kill-line-replace (&optional attach)
  (interactive)
  (let ((expr '(progn (move-beginning-of-line nil)
                      (kill-line)
                      (indent-for-tab-command))))
    (if attach
        (cursor-mode-eval-and-disable-mode expr)
      (cursor-mode-eval expr))))

(defun cursor-mode-ck-kill-line-replace-disable-mode ()
  (interactive)
  (cursor-mode-ck-kill-line-replace t))

(defun cursor-mode-ck-kill-region ()
  (interactive)
  (cursor-mode-eval '(kill-region (region-beginning) (region-end))))

(defun cursor-mode-ck-kill-region-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-region (region-beginning) (region-end))))

(defun cursor-mode-ck-kill-rectangle ()
  (interactive)
  (cursor-mode-eval '(kill-region (region-beginning) (region-end))))

(defun cursor-mode-ck-kill-rectangle-disable-mode ()
  (interactive)
  (cursor-mode-eval-and-disable-mode '(kill-region (region-beginning) (region-end))))

(defun cursor-mode-ck-kill-word-at-point (&optional attach)
  (interactive)
  (cursor-mode-ck-kill-thing-at-point 'word attach))

(defun cursor-mode-ck-kill-word-at-point-disable-mode ()
  (interactive)
  (cursor-mode-ck-kill-word-at-point t))

(defun cursor-mode-ck-kill-sexp-at-point (&optional attach)
  (interactive)
  (cursor-mode-ck-kill-thing-at-point 'sexp attach))

(defun cursor-mode-ck-kill-sexp-at-point-disable-mode ()
  (interactive)
  (cursor-mode-ck-kill-sexp-at-point t))

(defun cursor-mode-ck-kill-symbol-at-point (&optional attach)
  (interactive)
  (cursor-mode-ck-kill-thing-at-point 'symbol attach))

(defun cursor-mode-ck-kill-symbol-at-point-disable-mode ()
  (interactive)
  (cursor-mode-ck-kill-symbol-at-point t))

(global-set-key (kbd "C-k") 'kill-cursor-mode)


(provide 'cursor-mode-ck)
