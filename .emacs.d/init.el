(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
;; (package-initialize)
;; (package-refresh-contents)

(setq evil-want-C-u-scroll t)

;;; evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;;; nano core
(condition-case err
    (progn
      (add-to-list 'load-path "~/nano-emacs/")
      (load "~/nano-emacs/nano.el"))
  (error (message "nano core failed: %s" err)))


;;; base colors + faces (must come before themes)
(condition-case err
    (progn
      (require 'nano-base-colors)
      (require 'nano-faces))
  (error (message "nano faces failed: %s" err)))

;; ;;; dark theme (swap to nano-theme-light if you want light)
;; (condition-case err
;;     (require 'nano-theme-dark)
;;   (error (message "nano-theme-dark failed: %s" err)))

;; ;;; gruvbox theme
;; (condition-case err
;;     (progn
;;       (require 'nano-theme-gruvbox)
;;       (nano-theme-set-gruvbox)
;;       (nano-faces)
;;       (nano-theme))
;;   (error (message "gruvbox theme failed: %s" err)))

(condition-case err
    (progn
      (require 'nano-theme-ember)
      (nano-theme-set-ember)
      (nano-faces)
      (nano-theme))
  (error (message "ember theme failed: %s" err)))

;;; nano-theme (derives faces for other modes)
(condition-case err
    (require 'nano-theme)
  (error (message "nano-theme failed: %s" err)))

;;; after nano-theme loads, override font-lock faces directly, to be used with ember theme
(with-eval-after-load 'nano-theme
  ;; most things stay warm off-white
  (set-face-foreground 'font-lock-keyword-face       "#e08060")  ;; coral - const/for/return
  (set-face-foreground 'font-lock-type-face          "#c8b468")  ;; gold - int/double/auto
  (set-face-foreground 'font-lock-function-name-face "#c8b468")  ;; gold - function names
  (set-face-foreground 'font-lock-variable-name-face "#d8d0c0")  ;; fg - variables, plain
  (set-face-foreground 'font-lock-string-face        "#8a9868")  ;; olive - strings
  (set-face-foreground 'font-lock-comment-face       "#7890a0")  ;; steel - comments
  (set-face-foreground 'font-lock-constant-face      "#c09058")  ;; orange - constants
  (set-face-foreground 'font-lock-builtin-face       "#e08060"))  ;; coral - builtins

;;; splash
(condition-case err
    (require 'nano-splash)
  (error (message "nano-splash failed: %s" err)))

;;; layout
(condition-case err
    (require 'nano-layout)
  (error (message "nano-layout failed: %s" err)))

;;; session
(condition-case err
    (require 'nano-session)
  (error (message "nano-session failed: %s" err)))

;;; colors
(condition-case err
    (require 'nano-colors)
  (error (message "nano-colors failed: %s" err)))

(menu-bar-mode -1)
(tool-bar-mode -1)

;; space as leader in normal mode
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>,") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>.") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>bk") 'kill-buffer)

(condition-case err
    (progn
      (require 'nano-splash)
      (add-hook 'window-setup-hook
                (lambda ()
                  (nano-splash)
                  (cancel-function-timers 'nano-splash-fade-out-slow))))
  (error (message "nano-splash failed: %s" err)))


(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
