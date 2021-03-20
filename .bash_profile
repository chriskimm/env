source ~/.bashrc

# added by Anaconda3 4.4.0 installer
export PATH="/anaconda/bin:$PATH"

# Added this hack to get awsbscli to work.
# Not sure why pip installed it in ~/.local
export PATH="~/.local/bin:$PATH" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chriskimm/software/google-cloud-sdk/path.bash.inc' ]; then . '/Users/chriskimm/software/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chriskimm/software/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/chriskimm/software/google-cloud-sdk/completion.bash.inc'; fi

# opam configuration
test -r /Users/chriskimm/.opam/opam-init/init.sh && . /Users/chriskimm/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

