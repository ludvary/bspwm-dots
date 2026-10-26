#!/usr/bin/env bash
set -e
DOTS="$HOME/bspwm_dots"
SRC="$HOME/.config"
DEST="$DOTS/.config"
INCLUDE=(
    "btop"
    "doom"
    "bspwm"
    "sxhkd"
    "picom"
    "eww"
    "kitty"
    "lvim"
    "ranger"
    "rofi"
    "Thunar"
    "zathura"
    "dunst"
    "nitrogen"
    "zed"
    "fastfetch"
    "matplotlib"
    "alacritty"
    "fish"
    "yazi"
    "ghostty"
    "bat"
)

mkdir -p "$DEST"

INCLUDES=()
for item in "${INCLUDE[@]}"; do
  INCLUDES+=( "--include=$item/***" )
done

rsync -av --delete "${INCLUDES[@]}" --exclude="*" "$SRC/" "$DEST/"

rsync -av --delete "$HOME/.emacs.d" "$DOTS/"
rsync -av --delete "$HOME/nano-emacs" "$DOTS/"
rsync -av --delete "$HOME/.zshrc" "$DOTS/"
rsync -av --delete "$HOME/scripts" "$DOTS/"
rsync -av --delete "$HOME/.oh-my-zsh/themes/dieter.zsh-theme" "$DOTS/"
rsync -av --delete "$HOME/.vim" "$DOTS/"
rsync -av --delete "$HOME/.vimrc" "$DOTS/"

# # i hate writing comments, why are you reading this anyways??
cd "$DOTS"
git add -A
if git diff --cached --quiet; then
    echo "No changes to commit."
else
    # NOW=$(date '+%Y-%m-%d %H:%M:%S')
    # git commit -m "dots update: $NOW"
    echo "ready for gc..."
fi
