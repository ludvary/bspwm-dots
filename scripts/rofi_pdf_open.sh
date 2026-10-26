# late night, Apr 12, 2026
#!/usr/bin/env bash

# where we look for pdfs
where_the_pdfs_at="${1:-$HOME}"

# what opens the pdf
open_that_thing="${PDF_VIEWER:-zathura}"

# grab all the pdfs and make them look nice-ish
big_brain_pdf_list=$(fd -e pdf . "$where_the_pdfs_at" | while read -r lol; do
    just_the_name="${lol##*/}"
    make_it_pretty="${lol/#$HOME/~}"
    echo "$just_the_name | $make_it_pretty"
done)

# summon the chooser
what_did_user_pick=$(echo "$big_brain_pdf_list" | rofi -dmenu -i -matching fuzzy -sorting-method fzf -p "gimme pdf")

# did they bail?
if [ $? -ne 0 ] || [ -z "$what_did_user_pick" ]; then
    exit 0
fi

# extract the actual file path
actual_file="${what_did_user_pick#* | }"
actual_file="${actual_file/#\~/$HOME}"

# yeet it into zathura and forget about it
setsid "$open_that_thing" "$actual_file" >/dev/null 2>&1 &
