export JAVA_HOME=$(/usr/libexec/java_home)
export TZ=UTC
export PATH="$HOME/.ddg/bin:$PATH"

. /usr/local/opt/asdf/libexec/asdf.sh

# Add direnv to the zsh shell
eval "$(direnv hook zsh)"
