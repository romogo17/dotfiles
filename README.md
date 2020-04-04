# Roberto's `dotfiles`

This repository contains all the 🔧 dotfiles and other configuration files needed to setup my Mac. The intention is to take the effort out of reinstalling everything in my Mac and having a fresh setup in a breeze 🚀✨

## ✨ Fresh macOS setup

### 1️⃣ Before you begin

Since we're starting from scratch with a fresh setup, make sure you don't forget any of the following:

- Commit and push any changes/branches to your git repositories. You might find the following command useful for this
  ```sh
  git for-each-ref --format="%(refname:short) %(push:track)" refs/heads
  ```
- Save all important documents from non-iCloud or non-synced directories (pictures, photos, research articles, learning folders/courses, etc.)
- Save all of your work from apps which aren't synced
- Update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`

> 📌 **Note**: When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install Mackup (`brew install mackup`) and backup your settings (`mackup backup`). If you want to save your settings to a different directory or different storage than iCloud, [checkout the documentation](https://github.com/lra/mackup/blob/master/doc/README.md#storage). Also make sure your `.zshrc` file is symlinked from your dotfiles repo to your home directory.

### 2️⃣ Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### 3️⃣ Setting up your macOS

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install macOS Command Line Tools by running `xcode-select --install`
3. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
4. Clone this repo to `~/.dotfiles`
5. Run `./install.sh` to start the installation
6. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
7. Restart your computer to finalize the process
8. Your Mac is now ready to use! 🚀✨

> 📌 **Note**: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the [`.zshrc`](./.zshrc) file.

## Thanks to...

- [The original .macos script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).
- [Github does dotfiles](https://dotfiles.github.io/) project.
- Both [Zach Holman](https://github.com/holman/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) were great sources of inspiration.
- This dotfiles were heavily inspired by the [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/) article by [Dries Vints](https://github.com/driesvints)

