# Load in .bashrc -------------------------------------------------
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Add my bin to the path
[ -d  "$HOME/bin" ] && PATH="$PATH:$HOME/bin"
