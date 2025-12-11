;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Ethan Lai"
      user-mail-address "ethanlai@cyberangel.work")

(setq doom-font (font-spec :family "Fira Code Nerd Font" :size 16 :weight 'semi-bold)
      doom-variable-pitch-font (font-spec :family "Sarasa UI SC" :size 14))

(setq doom-theme 'doom-tokyo-night)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/personal/org/")


(setq shell-file-name (executable-find "bash"))
(global-auto-revert-mode 1)
(setq auto-revert-interval 1)

