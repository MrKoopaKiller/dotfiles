# ALIASES {{{
# General Aliases
alias ls='eza'
alias ll='eza -lh --git -a'
alias lst='eza -T --level 1'
alias del='trash'
alias rm='echo -ne " ❌ ${Red}"rm" command not allowed. ✅ ${Green} Use ${UGreen}"del"${NoColor}${Green} instead.\n${NoColor}"'
alias vim='nvim'
alias vi='nvim'

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

# TERRAFORM Aliases
alias tf="terraform"
alias tfa="terraform apply"
alias tfp="terraform plan"
alias tfi="terraform init"
alias tfi="terraform output"