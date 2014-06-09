# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

#MY ADDITIONS

#apply .bashrc
alias src="source ~/.bashrc"

#directory shortcuts
export MUSIC=/Users/parthivm/Music/iTunes/iTunes\ Media/Music #MUST BE QUOTED DUE TO SPACES I.E. 'cd "$MUSIC"'

#quick directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#show long form ls
alias ll="ls -l"
#show hidden files ls
alias la="ls -a"
#both
alias lal="ls -la"

#quick history
alias h="history 20"

#enable math in bc by default
alias bc='bc -l'

#highlight search term
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#confirm before overwriting existing files
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

#package installing permissions
alias apt-get="sudo apt-get"

#git shortcuts
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin master"

#homebrew
alias bi="brew install"

#display all music files in current directory
alias music="ls | egrep '.*\.(mp3|wav|mp4|aac)'" #piping ls into grep with extended regex

#immediately cd into newly created directory
function mkdircd () {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

#colored diff output
function diff {
    colordiff -u "$@" | less -RF
}

#folder shortcuts
alias cdcs="cd ~/Desktop/Recruiting/Portfolio\ \(CS\)/"

#alias path='echo PATH=$PATH'
alias cdai="cd ~/Desktop/Classes/CS188/"
alias cdu="cd ~/Desktop/Classes/CS9E/"
alias c="ssh 61c"
alias cont='vi `ls -t | head -n 1`'
alias part3='echo > login5.txt ; 
for name in nova quasar pulsar
do
    x=`cat $name`
    ssh $x who | cut -d" " -f1 | sort -u >> login5.txt 2>/dev/null
done;
cat login5.txt'
