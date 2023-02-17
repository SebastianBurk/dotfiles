;;; init.el --- TEXT -*- lexical-binding: t -*-
;;; Commentary:

;;
;;
;;

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;(require 'init-benchmarking) ;; Measure startup time

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; Bootstrap config

(setq custom-file (locate-user-emacs-file "custom.el"))
;;(require 'init-utils)
;;(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
;;(require 'init-exec-path) ;; Set up $PATH

;; Allow users to provide an optional "init-preload-local.el"
(require 'init-preload-local nil t)


(setq load-prefer-newer t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(column-number-mode nil)



(require 'init-org)
(require 'init-ui)

(provide 'init)

;;; init.el ends here
