## ALIASES
# General Aliases
alias ls='eza'
alias ll='eza -lh --git -a'
alias lst='eza -T --level 1'
alias del='trash'
alias rm='echo -ne " ❌ ${Red}"rm" command not allowed. ✅ ${Green} Use ${UGreen}"del"${NoColor}${Green} instead.\n${NoColor}"'
alias vim='nvim'
alias vi='nvim'
alias awslog='aws sso login --sso-session'

# DOCKER Aliases
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# GIT Aliases
alias gs="git status"
alias gc="git clone"
alias ga="git add"
alias gb="git checkout -b"
alias gci="git commit"
alias gco="git checkout"
alias gp="git pull"
alias gpp="git push -u"
alias gst="git stash"
alias gsp="git stash pop"

# K8S Aliases
alias mk="minikube"
alias k="kubectl"
alias kg="k get"
alias kd="k describe"
alias kl="k logs"
alias kaf="k apply -f"
alias kdel="k delete"
alias kgp="kg pods"
alias kgs="kg svc"
alias kgi="kg ing"
alias kx="kubectl-ctx"
alias kv="kubens"

# TERRAFORM Aliases
alias tf="terraform"
alias tfa="tf apply"
alias tfp="tf plan"
alias tfi="tf init"
alias tfo="tf output"
alias tg="terragrunt"
alias tgi="tg init"
alias tgp="tg plan"
alias tga="tg apply"

# Docker / podman
alias d="docker"
alias docker="podman"
alias docker-compose="podman-compose"
alias dc="podman-compose"
alias dex="docker exec -it"
alias dlogs="docker logs"
alias dps="docker ps"

## FUNCTIONS
# Set SSH key for gitconfig
setcreds() {
  PWD="$HOME/.ssh"
  KEY=$1
  unlink ${PWD}/id_ed25519
  ln -s ${PWD}/${KEY} ${PWD}/id_ed25519
}