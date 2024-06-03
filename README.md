# 在 Linux 上安裝 LINE App (Chromium Extension)

It's an unofficial script for installing a desktop entry for LINE's chromium extension.

目前（2024.06.）若要在 Linux 上要執行 LINE 的話，最簡單的方法應該是用 chromium 的 LINE extension。透過以下步驟，可以在 app menu 中新增 LINE extension 的 desktop entry。

1. Clone this repo.

```
git clone https://github.com/hengtseChou/linux-line-shortcut
```

2. Run install.sh. 腳本會自行檢查是否有安裝 LINE extension，並新增 desktop entry。

```
cd linux-line-shortcut
./install.sh
```

完成後便可以在 Application 選單中找到 LINE 的連結。

![screenshot](https://github.com/[hengtsechou]/[linux-line-desktop-entry]/blob/[main]/screenshot.png?raw=true)
