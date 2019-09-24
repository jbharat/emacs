(require 'ranger)
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(setq ranger-cleanup-on-disable t
      ranger-listing-dir-first t
      ranger-persistent-sort t
      ranger-footer-delay nil
      )

(ranger-override-dired-mode t)
(use-package all-the-icons
  :defer t
  :after neotree
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'nerd))
  )

(use-package neotree
  :defer t
  :after projectile
  :config
  (setq neo-window-width 35
        neo-smart-open t
        neo-show-hidden-files t
        neo-force-change-root t
        projectile-switch-project-action 'neotree-projectile-action
        neo-window-fixed-size nil)
  )

(provide 'b-files)