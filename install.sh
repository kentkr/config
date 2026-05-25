
# brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# brew install git
brew install git

# different softwares
brew install python
brew install python@3.11
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask slack
brew install node
brew install tmux
brew install font-hack-nerd-font
brew install grep
brew install awscli
brew install tree
brew install uv
# neovim 0.10.4 - not installable through brew
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
sudo mv nvim-macos-arm64 /usr/local/nvim-0.10.4
sudo ln -sf /usr/local/nvim-0.10.4/bin/nvim /usr/local/bin/nvim
npm install -g neovim
pip3 install pynvim
