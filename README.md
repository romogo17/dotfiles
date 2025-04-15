# Roberto's `dotfiles`

This repository contains all the 🔧 dotfiles and other configuration files needed to setup my Mac. The intention is to take the effort out of reinstalling everything in my Mac and having a fresh setup in a breeze 🚀✨

### 1️⃣ Before you begin

Since we're starting from scratch with a fresh setup, make sure you don't forget any of the following:

- Commit and push any changes/branches to your git repositories. You might find the following command useful for this
  ```sh
  git for-each-ref --format="%(refname:short) %(push:track)" refs/heads
  ```
- Save all important documents from non-iCloud or non-synced directories (pictures, photos, research articles, learning folders/courses, etc.)
- Save all of your work from apps which aren't synced
- Backup any needed `ssh` keys

### 2️⃣ Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://support.apple.com/en-us/HT204904) to cleanly install the latest macOS version.

### 3️⃣ Configuring macOS

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install macOS Command Line Tools by running `xcode-select --install`
3. Copy your public and private SSH keys to `~/.ssh` or generate new ones and make sure they're set to mode `600`
4. Add your `ssh` and `gpg` keys to [GitHub](https://github.com/settings/keys)
5. Clone this repo to `~/.dotfiles`
   ```sh
   git clone git@github.com:romogo17/dotfiles.git ~/.dotfiles
   ```
6. Run `scripts/prerequisites.sh` to setup `homebrew` and `ansible`
7. Execute the main playbook with

   ```sh
   # Setup the dotfiles
   ansible-playbook main.yml --ask-become-pass

   # If you cannot run privileged commands
   ansible-playbook main.yml --skip-tags privileged
   ```

8. Restart your computer to finalize the process
9. Your Mac is now ready to use! 🚀✨
