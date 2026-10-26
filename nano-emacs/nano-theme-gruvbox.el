;; nano-theme-gruvbox.el --- Gruvbox dark theme for nano-emacs

(require 'nano-base-colors)

(defun nano-theme-set-gruvbox ()
  "Apply Gruvbox dark theme to nano-emacs."
  (setq frame-background-mode    'dark)
  (setq nano-color-background    "#282828")  ;; bg
  (setq nano-color-foreground    "#EBDBB2")  ;; fg
  (setq nano-color-highlight     "#3C3836")  ;; bg1 - selection/cursor line
  (setq nano-color-subtle        "#504945")  ;; bg2 - subtle backgrounds
  (setq nano-color-faded         "#A89984")  ;; fg4 - comments, inactive
  (setq nano-color-salient       "#83A598")  ;; bright blue - keywords, links
  (setq nano-color-strong        "#EBDBB2")  ;; fg - bold text
  (setq nano-color-critical      "#FB4934")  ;; bright red - errors/warnings
  (setq nano-color-popout        "#FABD2F")  ;; bright yellow - standout highlights
  (setq nano-theme-var           "dark"))

(provide 'nano-theme-gruvbox)
