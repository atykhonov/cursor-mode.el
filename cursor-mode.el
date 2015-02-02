(defvar cursor-mode-cursor nil "Overlay for cursor.")

(defvar cursor-mode-current-map nil "Current keymap.")

(defface cursor-mode-cursor-face
  '((t (:inverse-video t)))
  "The face used for fake cursors."
  :group 'cum)

(defun cursor-mode-eval (expr &optional move-cursor)
  (cursor-mode--move-overlay expr t t))

(defun cursor-mode-eval-and-disable-mode (expr &optional move-cursor)
  (cursor-mode--move-overlay expr nil t)
  (cursor-mode-disable-mode-at-cursor))

(defun cursor-mode--move-overlay (expr &optional keep-pred move-cursor)
  "Executes expression `expr' and moves the overlay to the new
position. New position is the same position if the regular cursor
was used instead. If `move-cursor' is `t' then move cursor to the
same position as overlay is located."
  (interactive)
  (when keep-pred
    (set-temporary-overlay-map cursor-mode-current-map))
  (let ((old-pos nil)
        (new-pos nil)
        (point nil))
    (setq old-pos (point))
    (goto-char (overlay-start cursor-mode-cursor))
    (eval expr)
    (setq point (point))
    (if (eolp)
        (progn
          (move-overlay cursor-mode-cursor point point)
          (overlay-put cursor-mode-cursor 'after-string (propertize " " 'face 'cursor-mode-cursor-face)))
      (progn
        (move-overlay cursor-mode-cursor point (+ point 1))
        (overlay-put cursor-mode-cursor 'after-string nil)
        (overlay-put cursor-mode-cursor 'face 'cursor-mode-cursor-face)))
    (when (null move-cursor)
      (goto-char old-pos))))

(defun cursor-mode-disable-mode ()
  (interactive)
  (when (overlayp cursor-mode-cursor)
    (delete-overlay cursor-mode-cursor))
  (setq cursor-mode-cursor nil)
  (set-temporary-overlay-map nil))

(defun cursor-mode-disable-mode-at-cursor ()
  (interactive)
  (goto-char
   (overlay-start cursor-mode-cursor))
  (cursor-mode-disable-mode))

(defun cursor-mode--make-cursor-overlay-at-eol (pos)
  "Create overlay to look like cursor at end of line."
  (let ((overlay (make-overlay pos pos nil nil nil)))
    (overlay-put overlay
                 'after-string (propertize " " 'face 'cursor-mode-cursor-face))
    overlay))

(defun cursor-mode--make-cursor-overlay-inline (pos)
  "Create overlay to look like cursor inside text."
  (let ((overlay (make-overlay pos (1+ pos) nil nil nil)))
    (overlay-put overlay 'face 'cursor-mode-cursor-face)
    overlay))

(defun cursor-mode--make-cursor (map &optional display)
  "Create overlay to look like cursor.
Special case for end of line, because overlay over a newline
highlights the entire width of the window."
  (interactive)
  (let ((overlay nil))
    (setq overlay (if (eolp)
                      (cursor-mode--make-cursor-overlay-at-eol (point))
                    (cursor-mode--make-cursor-overlay-inline (point))))
    (overlay-put overlay 'keymap map)
    (overlay-put overlay 'tag 'decur)
    (when display
      (overlay-put overlay 'display display))
    overlay))

(defun cursor-mode-destroy-cursor ()
  (interactive)
  (when (overlayp cursor-mode-cursor)
    (delete-overlay cursor-mode-cursor)
    (setq cursor-mode-cursor nil))
  (set-temporary-overlay-map nil))

(defun cursor-mode-define-key (keymap key def &optional meta)
  (let ((prefix nil))
    (define-key keymap key def)
    (if meta
        (setq prefix "M")
      (setq prefix "C"))
    (define-key keymap (kbd (concat prefix "-" key)) (intern (concat (symbol-name def) "-disable-mode")))))

(defmacro define-cursor-mode (name display &rest body)
  (declare (indent 2))
  (let* ((map-name (concat (symbol-name name) "-map"))
         (map (intern map-name)))
    `(progn
       (setq ,map
             (let ((map (make-sparse-keymap)))
               (suppress-keymap map)
               ,@body
               map))
       (defun ,name ()
         (interactive)
         (cursor-mode-destroy-cursor)
         (setq cursor-mode-current-map ,map)
         (set-temporary-overlay-map cursor-mode-current-map)
         (setq cursor-mode-cursor
               (cursor-mode--make-cursor cursor-mode-current-map ,display))))))

(provide 'cum)
