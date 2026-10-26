;; nano-theme-ember.el --- Ember dark theme for nano-emacs

(require 'nano-base-colors)

(defun nano-theme-set-ember ()
  "Apply Ember dark theme to nano-emacs."
  (setq frame-background-mode    'dark)
  (setq nano-color-background    "#1c1b19")  ;; ember dark bg
  (setq nano-color-foreground    "#d8d0c0")  ;; warm off-white fg
  (setq nano-color-highlight     "#2a2825")  ;; slightly lifted bg for selection
  (setq nano-color-subtle        "#323028")  ;; subtle bg, line numbers etc
  (setq nano-color-faded         "#7890a0")  ;; steel - comments, inactive
  (setq nano-color-salient       "#e08060")  ;; coral - keywords, links
  (setq nano-color-strong        "#d8d0c0")  ;; fg - bold text
  (setq nano-color-critical      "#b07878")  ;; rose - errors/warnings
  (setq nano-color-popout        "#c8b468")  ;; gold - strings, highlights
  (setq nano-theme-var           "dark"))

(provide 'nano-theme-ember)
