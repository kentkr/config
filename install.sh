
# brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# brew install git
brew install git

# different softwares
brew install python
brew install --cask google-chrome
brew install --cask iterm2
brew install neovim
brew install --cask slack
brew install node
npm install -g neovim
brew install tmux
brew install font-hack-nerd-font
