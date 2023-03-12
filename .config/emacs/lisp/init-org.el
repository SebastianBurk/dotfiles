;;; init-org.el --- TEXT -*- lexical-binding: t -*-
;;; Commentary:

;;
;;
;;

;;; Code:

(setq initial-major-mode 'org-mode)
(setq org-ellipsis " ▼")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)
(use-package org-bullets
:ensure t
:init
(add-hook 'org-mode-hook 'org-bullets-mode))
(org-babel-do-load-languages
 'org-babel-load-languages
 '())

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Notes")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(provide 'init-org)
;;; init-org.el ends here
