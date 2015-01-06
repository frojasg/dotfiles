;; ===== Set standard indent to 2 rather that 4 ====
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)
;;(require 'pallet)


(add-to-list 'load-path "~/.emacs.d/custom")

;;(load "01-projectile.el")

;;(load-theme 'zenburn t)
;;(set-cursor-color "firebrick")

;; Font
;; https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/#download-primary
;;(set-frame-font "Fira Mono OT-14" nil t)


;; /This/ file (~init.el~) that you are reading
;; should be in this folder
(add-to-list 'load-path "~/.emacs.d/")

;; Package Manager
;; See ~Cask~ file for its configuration
;; https://github.com/cask/cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Keeps ~Cask~ file in sync with the packages
;; that you install/uninstall via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)

;; Root directory
(setq root-dir (file-name-directory
                (or (buffer-file-name) load-file-name)))

;; Theme
;; https://github.com/bbatsov/zenburn-emacs
;;(load-theme 'zenburn t)
(set-cursor-color "firebrick")

;; Font
;; https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/#download-primary
(set-frame-font "Fira Mono OT-14" nil t)


(projectile-global-mode)
(add-hook 'ruby-mode-hook 'projectile-on)
(setq projectile-switch-project-action 'projectile-dired)
;; (setq projectile-enable-caching t)
 (setq projectile-completion-system 'grizzl)
 ;; Press Command-p for fuzzy find in project
;; (global-set-key (kbd "s-p") 'projectile-find-file)
 ;; Press Command-b for fuzzy switch buffer
;; (global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(put 'upcase-region 'disabled nil)
