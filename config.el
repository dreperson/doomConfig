;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Set the font to Iosevka at size 31
(setq doom-font (font-spec :family "Iosevka" :size 31))

;; Set your name and email
(setq user-full-name "Dré Person"
      user-mail-address "dre.person@gmail.com")

;; Specify the theme
(setq doom-theme 'doom-molokai)

;; Enable line numbers
(setq display-line-numbers-type 'relative)

;; Re-enable auto-save and backups
(setq auto-save-default t
      make-backup-files t)

(after! org
  ;; Set the default org directory
  (setq org-directory "/home/dre/Documents/org/")
  ;; Set the default org agenda files
  (setq org-agenda-files '("/home/dre/Documents/org/"))
  ;; Enable auto-fill mode and visual-line mode for better text wrapping
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  ;; Enable automatic list continuation in Org mode
  (setq org-list-allow-alphabetical t
        org-auto-align-tags t
        org-list-indent-offset 2)
  ;;Enable shift select
  (setq org-support-shift-select 'always))

;; Enabling org roam?
(use-package! org-roam
  :init
  (setq org-roam-v2-ack t) ; Acknowledge v2 update?
  :custom
  (org-roam-directory (file-truename "~/Documents/org/org-roam"))
  :config
  (org-roam-db-autosync-mode))

;;Enabling org-journal?
(use-package! org-journal
  :custom
  (org-journal-dir "~/Documents/org/journal") ;; Directory for journal files
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-date-format "%B %e, %Y")
  (org-journal-time-prefix "* ")
  (org-journal-time-format "%I:%M %p")
  (org-journal-enable-agenda-integration t))

;; Custom keybindings
(defun insert-c-code-block ()
  "Insert a C Code block in org mode."
  (interactive)
  (insert "#+BEGIN_SRC c \n#+END_SRC")
  (forward-line -1)) ;;Move cursor inside text block
;;
(map! :leader
      :desc "Open init file" "f p" #'find-file
      :desc "M-x" "SPC" #'execute-extended-command
      :desc "Open Treemacs" "o T" #'treemacs
      :desc "Open vterm" "o v" #'vterm
      :desc "Insert C code block" "# c" #'insert-c-code-block)


(map! :i "M-e" (lambda () (interactive) (insert "é")))


;; Additional settings can go here
;; Use Nov-mode to open EPUBs
(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (setq nov-text-width 80))
