# Helper function to directly cd into the mkdir
function mcd(){
   mkdir -p -- "$1" && cd -P -- "$1"
}
export mcd

#export JAVA_HOME=$(/usr/libexec/java_home)

# Help make N calls in P parallel batches
function conc(){
    cmd=("${@:3}")
    seq 1 "$1" | xargs -n1 -P"$2" "${cmd[@]}"
}

function githash(){
  git rev-parse head
}

function portwho(){
  lsof -nP | grep LISTEN | grep :$1
}

get_kube_context(){
    echo $KUBECONFIG | sed 's:.*/::'
}

#Compiler Flags. See if you need it
export LDFLAGS="-L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl@1.1/include"

# Colorized cat
alias cat="ccat $*"
alias cat0="/bin/cat $*" # for cases when you need plain `cat`

# Rm has repercussions. BewareG
alias rm='rm -i'

# Convenience dirs
alias w='cd ~/Work'
alias gc='cd ~/gocode/src/code.uber.internal/'
alias gco='cd ~/gocode'

# Counting lines but excluding certain dir
alias cloce='cloc --exclude-dir node_modules,.idea,vendor'

# go-code : mono-repo, gocode: micro repo
alias mgc='cd ~/go-code/src/code.uber.internal/'
alias mgco='cd ~/go-code'
alias ds='cd ~/Desktop'
alias s='cd ~/Shenanigans'
alias d='cd ~/Downloads'
alias o='cd /Users/aman.garg/OSS'
alias kcd='cd /Users/aman.garg/.kube'
alias m2='cd /Users/aman.garg/.m2/repository'


# Navigation
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


# Make grep more user friendly by highlight matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.git'
alias epoch='date +%s'

#Git aliases
alias branch='git rev-parse --abbrev-ref HEAD'alias branch='git rev-parse --abbrev-ref HEAD'
alias gs='git status'
alias gl='git log'
alias glo='git log --oneline'
alias gcl='git config --list --local'
alias gclg='git config --list --global'
alias gd='git diff'
alias personal_repo='git config --local --replace-all user.email "amangarg1995sep@gmail.com"'
alias work_repo='git config --local --replace-all user.email "aman.garg@uber.com"'
alias whoadd='gl --diff-filter=A'
alias whomod='gl --diff-filter=M'
alias gdn='gd --name-only'
alias gsl='git stash list'
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'
#alias mcj="mvn clean jacoco:prepare-agent install sonar:sonar -Dsonar.verbose=true -Dsonar.coverage.jacoco.xmlReportPaths=$(find "$(pwd)" -path '*jacoco.xml' | sed 's/.*/&/' | tr '\n' ',')"
alias mcjr='mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent org.jacoco:jacoco-maven-plugin:report install sonar:sonar'
alias branches="git for-each-ref --sort=-committerdate refs/heads/ | awk '{print $3}' | sed  's@refs/heads@@g' "
function gsa(){ git stash apply stash@{$1}; }
function gsd(){ git stash drop stash@{$1}; }
function gss(){ git stash show -p stash@{$1}; }

#Brew aliases
alias bss='brew services start'
alias bsp='brew services stop'
alias bsl='brew services list'
alias bsr='brew services restart'

#Sonar
#alias sonarqube='/Applications/SonarQube/bin/macosx-universal-64/sonar.sh console'
#alias sonarqube='/Users/aman.garg/OSS/sonarqube-8.6.0.39681/bin/macosx-universal-64/sonar.sh console'

#Kafka Cat
alias kc='kafkacat'

#Kubectl
alias k='kubectl'
alias kd='kubectl describe'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias kdp='kubectl describe pod'
alias kl='kubectl logs'
alias kdel='kubectl delete'
alias kdels='kubectl delete service'
alias kdeld='kubectl delete deployment'
alias kdelp='kubectl delete pod'
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kgrs='kubectl get rs'
alias kdash='kubectl auth-proxy -n k8s-dashboard-oidc http://kubernetes-dashboard.svc'
alias kgsec='kubectl get secret'
alias kgcm='kubectl get configmaps'
alias kdcm='kubectl describe configmaps'
alias kgsa='kubectl get serviceaccounts'
alias kdsa='kubectl describe serviceaccounts'
alias kgse='kubectl get secrets'
alias kdse='kubectl describe secrets'

function kbash(){
	kubectl exec -it "$1" bash
}

function dbash(){
	docker exec -it "$1" bash
}

#Kubctl context
#alias kpreprod='export KUBECONFIG=~/.kube/contexts/demand-preprod'


#Docker Swarm
alias dip='docker node inspect --format '\''{{.Status.Addr}}'\'' '
alias dlogs=' docker logs --follow '
alias dport='docker service inspect --format="{{with index .Endpoint.Ports 0}}{{.PublishedPort}}{{end}}" '
alias sds='docker stack'
alias sdse='docker service'
alias sdn='docker node'


function code() {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

function webs() {
  open -na "WebStorm.app" --args "$@"
}

function goland() {
  open -na "GoLand.app" --args "$@"
}

function idea() {
  open -na "IntelliJ IDEA.app" --args "$@"
}

function clion() {
  open -na "CLion.app" --args "$@"
}














