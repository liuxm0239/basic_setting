# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell.zsh-theme_my" )
ZSH_THEME=( "robbyrussell_my" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"


# User specific aliases and functions
fqtype () {
        less $1 | head -n 999 | awk '{if(NR%4==0) printf("%s",$0);}' \
        | od -A n -t u1 -v \
        | awk 'BEGIN{min=100;max=0;}\
        {for(i=1;i<=NF;i++) {if($i>max) max=$i; if($i<min) min=$i;}}END\
        {if(max<=74 && min<59) print "Phred+33"; \
        else if(max>73 && min>=64) print "Phred+64"; \
        else if(min>=59 && min<64 && max>73) print "Solexa+64"; \
        else print "Unknown score encoding"; \
        print "( " min ", " max, ")";}'
}

ex () {
        if [ -f $1 ] ; then
                case $1 in
        		*.tar.bz2)   tar xjf $1;;
		        *.tar.gz)    tar xzf $1;;
		        *.bz2)       bunzip2 $1;;
		        *.rar)       rar x $1;;
		        *.gz)        gunzip $1;;
		        *.tar)       tar xf $1;;
		        *.tbz2)      tar xjf $1;;
		        *.tgz)       tar xzf $1;;
		        *.zip)       unzip $1;;
		        *.Z)         uncompress $1;;
		        *.7z)        7z x $1;;
		        *)           echo "'$1' cannot be extracted via extract()" ;;
        	esac
        else
                echo "'$1' is not a valid file"
        fi
}



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# added by Miniconda2 installer
export PATH="/work_place/software/miniconda2/bin:$PATH"

# some more ls aliases
#alias ipython='python -m IPython'
alias sqls='sudo service mysql start'
alias sqlst='mysql -uroot -p'
alias py3='source activate py3'
alias ll='ls -lF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias cd..="cd .."
alias h="head -n "
alias le="less -S -N "
alias rm='rm -i'
alias sync="rsync -actvP "
alias ss='sudo service ssh --full-restart'
#alias rna="cd /ifs5/ST_ANNO/USER/liuxingmin/projects/PCAWG/RNA"
alias tp="top -u liuxingmin"
alias psx="ps x"
alias cdh='cd /work_place/projects'
alias soft='cd /work_place/software'

export PATH="\
/work_place/software/alignment_algorithm/tools/bin:\
/work_place/software/alignment_algorithm/ncbi-blast-2.7.1+/bin:\
/work_place/software/miniconda3/bin:\
$PATH"

export HTSLIB_DIR="/work_place/software/alignment_algorithm/samtools-1.5/htslib-1.5/"

export LD_LIBRARY_PATH="\
/work_place/software/alignment_algorithm/tools/lib:\
$LD_LIBRARY_PATH"

####gcc
export CPATH="/work_place/software/alignment_algorithm/tools/include"
export CFLAGS="-I/work_place/software/basic_bin/tools/include -I/usr/include"
export LDFLAGS="-L/work_place/software/basic_bin/tools/lib -L/usr/lib"
export PKG_CONFIG_PATH="\
/usr/lib64/pkgconfig:\
/work_place/software/basic_bin/tools/lib/pkgconfig:\
/work_place/software/genome/tools/lib/pkgconfig:\
$PKG_CONFIG_PATH"

#### java
jdk6_home="/work_place/software/java/jdk1.6.0_16"
jdk7_home="/work_place/software/java/jdk1.7.0_79"
jdk8_home="/work_place/software/java/jdk1.8.0_131"
#default java8
case $1 in
    jdk6 )
        export JAVA_HOME=$jdk6_home
        ;;
    jdk7 )
        export JAVA_HOME=$jdk7_home
        ;;
    jdk8 )
        export JAVA_HOME=$jdk8_home
        ;;
    * )
        export JAVA_HOME=$jdk8_home
        ;;
esac
export PATH="\
	$JAVA_HOME/bin:\
	$JAVA_HOME/jre/bin:\
	$PATH"

export JRE_HOME="${JAVA_HOME}/jre"

#### less env
export LESSOPEN="|/home/liuxingmin/.lessConfig/lesspipe.sh %s"
export DISPLAY=:0

eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
export MANPATH=$HOME/perl5/man:$MANPATH

if [ -d /work_place/projects ]; then
	cd /work_place/projects
fi

