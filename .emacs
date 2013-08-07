(require 'dabbrev)
(setq dabbrev-always-check-other-buffers t)
(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")

(global-set-key "\C-i" 'my-tab)

(defun my-tab (&optional pre-arg)
  "If preceeding character is part of a word then dabbrev-expand,
else if right of non whitespace on line then tab-to-tab-stop or
indent-relative, else if last command was a tab or return then dedent
one step, else indent 'correctly'"
  (interactive "*P")
  (cond ((= (char-syntax (preceding-char)) ?w)
         (let ((case-fold-search t)) (dabbrev-expand pre-arg)))
        ((> (current-column) (current-indentation))
         (indent-relative))
        (t (indent-according-to-mode)))
  (setq this-command 'my-tab))

(add-hook 'html-mode-hook
          '(lambda ()
             (local-set-key "\C-i"     'my-tab)))
(add-hook 'sgml-mode-hook
          '(lambda ()
             (local-set-key "\C-i"     'my-tab)))
(add-hook 'perl-mode-hook
          '(lambda ()
             (local-set-key "\C-i"     'my-tab)))
(add-hook 'text-mode-hook
          '(lambda ()
             (local-set-key "\C-i"     'my-tab)))

; add more hooks here
