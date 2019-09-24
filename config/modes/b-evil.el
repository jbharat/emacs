(require 'evil)
(setq evil-search-module 'evil-search
   ;; evil-insert-state-message nil
   evil-want-C-i-jump nil
   )
(evil-mode)
(fset 'evil-visual-update-x-selection 'ignore)
(eval-after-load 'evil-ex
 '(evil-ex-define-cmd "jsf" (lambda ()
                              (interactive)
                              (json-mode)
                              (json-pretty-print-buffer))))

(evil-define-operator evil-move-up (beg end)
 "Move region up by one line."
 :motion evil-line
 (interactive "<r>")
 (if (not (eq evil-state 'normal))
     (evil-visual-line))
 (let ((beg-line (line-number-at-pos beg))
       (end-line (line-number-at-pos end))
       (dest (- (line-number-at-pos beg) 2)))
   (evil-move beg end dest)
   (goto-line (- beg-line 1))
   (exchange-point-and-mark)
   (goto-line (- end-line 2))
   (if (not (eq evil-state 'normal))
       (evil-visual-line))
   )
 )

(evil-define-operator evil-move-down (beg end)
 "Move region down by one line."
 :motion evil-line
 (interactive "<r>")
 (if (not (eq evil-state 'normal))
     (evil-visual-line))
 (let ((beg-line (line-number-at-pos beg))
       (end-line (line-number-at-pos end))
       (dest (+ (line-number-at-pos end) 0)))
   (evil-move beg end dest)
   (goto-line (+ beg-line 1))
   (exchange-point-and-mark)
   (goto-line (+ end-line 0))
   (if (not (eq evil-state 'normal))
       (evil-visual-line))
   )
 )

(setq evil-visual-state-cursor `((hbar . 3) ,nord-visual)
      evil-normal-state-cursor `(box ,nord-normal)
      evil-insert-state-cursor `((bar . 3) ,nord-insert)
)

(use-package evil-surround
  :defer t
  :after evil
  :init
  (global-evil-surround-mode 1)
  )

(use-package evil-leader
  :after evil ivy
  :defer t
  :init
  (global-evil-leader-mode)
  )

(use-package evil-visualstar
  :defer t
  :after evil
  :init
  (global-evil-visualstar-mode t))

(use-package evil-multiedit
  :defer t
  :after evil
  :config
  (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)
  ; (add-hook 'evil-multiedit-state-entry-hook (lambda () (highlight-thing-mode -1)))
  ; (add-hook 'evil-multiedit-state-exit-hook (lambda () (highlight-thing-mode +1)))
  )

(use-package evil-nerd-commenter
  :defer t
  :after evil-leader
  )

(provide 'b-evil)