;;; init-ui.el --- TEXT -*- lexical-binding: t -*-
;;; Commentary:

;;
;;
;;

;;; Code:


(setq inhibit-startup-message t)
(menu-bar-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode 0)
(set-window-scroll-bars (minibuffer-window) nil nil)
(tooltip-mode -1)
(setq visible-bell -1)
(global-display-line-numbers-mode 0)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Fonts

(add-to-list 'default-frame-alist '(font . "Source Code Pro"))

;; Icons

(use-package all-the-icons)

;; Modeline

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Themes

(use-package solarized-theme
  :ensure t)
(use-package base16-theme
  :ensure t)
(load-theme 'base16-eighties t)

(provide 'init-ui)
;;; init-ui.el ends here
