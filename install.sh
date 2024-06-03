#!/bin/bash
show_help() {
    echo "Usage: $(basename $0) [OPTION]"
    echo "Create LINE desktop entry."
    echo ""
    echo "Options:"
    echo "  --user-data-dir          Specifies the directory that user data (your "profile") is kept in."
    echo "  --help                   Display this help and exit."
}


if ! which chromium >/dev/null; then
    echo "Chromium not found. Make sure you have chromium installed."
    exit 1
fi

user_data_dir="$HOME/.config/chromium"
case "$1" in
    --user-data-dir)
        user_data_dir="$2"
        ;;
    --help)
        show_help
        exit 0
        ;;
esac

echo "LINE: using user profile stored under $user_data_dir"

if [ ! -d "$user_data_dir/Default/Extensions/ophjlpahpchlmihnnnihgmmeilfjmjjc" ]; then
    echo "LINE extension is not installed. Make sure you have the extension installed. Visit https://chromewebstore.google.com/detail/line/ophjlpahpchlmihnnnihgmmeilfjmjjc for more info."
    exit 1
fi

echo "LINE: creating desktop entry"
desktop_file=$(cat "line.desktop")
desktop_file=$(echo "$desktop_file" | sed "/--window-size=800,600/ s/\$/ --user-data-dir=\"$(echo $user_data_dir | sed 's/[&/\]/\\&/g')\"/")

mkdir -p $HOME/.local/share/applications
echo "$desktop_file" > $HOME/.local/share/applications/line.desktop
mkdir -p $HOME/.icons
cp LINE.png $HOME/.icons/LINE.png
echo "LINE: updating desktop database"
sudo update-desktop-database
echo "LINE: desktop entry created"
