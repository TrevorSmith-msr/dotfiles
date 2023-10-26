. "$HOME/.cargo/env"

# openresty
export OPENRESTY_PREFIX="/opt/homebrew/Cellar/openresty/1.21.4.2_1"
export PATH=$OPENRESTY_PREFIX/nginx/sbin:$OPENRESTY_PREFIX/bin:$OPENRESTY_PREFIX/luajit/bin:$PATH

# Terragrunt
export TERRAGRUNT_FAIL_ON_STATE_BUCKET_CREATION=true
export TERRAGRUNT_DISABLE_BUCKET_UPDATE=true

export PATH="$PATH:$HOME/.local/bin:$HOME/.goat/bin"
. ~/.asdf/plugins/golang/set-env.zsh

# pnpm
export PNPM_HOME="/Users/trevorsmith/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# bit
case ":$PATH:" in
  *":/Users/trevorsmith/bin:"*) ;;
  *) export PATH="$PATH:/Users/trevorsmith/bin" ;;
esac
# bit end
