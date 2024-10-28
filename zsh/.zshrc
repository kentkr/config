
# added by homebrew during install
eval "$(/opt/homebrew/bin/brew shellenv)"

# creating the bin path for this new .bashrc executab
PATH=$PATH:~/bin

# some thing for iterm
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# alias to go to new dropbox folder
alias cdDropbox='cd /Users/kylekent/Library/CloudStorage/Dropbox'

# for spaceduck with iterm
export CLICOLOR=1

export TERM=xterm-256color

# export path that will allow the homebrew version of git to be used 
export PATH="/usr/local/bin:${PATH}"

# zsh prompt modifications
PROMPT="%F{98}%*: %~ $%f "
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# jekyll home path
export GEM_HOME="$HOME/.gem"

# export python3 path to path
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# python3-sphinx path for making spark docs
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
# set specific python version - 3.11
#export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"

# venv activation
alias sv='source venv/bin/activate'

# avoid % eol val 
export PROMPT_EOL_MARK=''
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

